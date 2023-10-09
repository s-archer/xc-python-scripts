# Author: Stephen Archer
# Date: 14-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script provides a search thropugh all API tokens, identifies expired ones and asks if want to delete each one.
#
# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json
import time
from datetime import datetime


# Set variables and collect input from user, including tenant, token, and the search criteria 
# Change values after 'or' to real values, for faster testing (just hit enter instead of manual inputs).  
tenant                  = input("\nEnter F5 XC Tenant: ") or "my-tenant"
token                   = input("\nEnter F5 XC Token: ") or "my-token"
user_email              = input("\nEnter F5 XC User Email (or use 'all' to review/delete all expired tokens): ") or "my@email.com"

# Define the F5 XC API call
def request(rtenant, rtoken, rapi, rmethod, rdata):
    if rmethod == "post":
        return requests.post('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken }, data=rdata)
    elif rmethod == "get":
        return requests.get('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })
    else:
        print("Incorrect method")


def namespaces():
    # Send the first API call to get a list of all namespaces configured in the Tenant (defined in variables above)
    nresponse = request(tenant, token, "/web/namespaces", "get", "").text
    return json.loads(nresponse)['items']


def apicreds():
    # Send API call to get a list of all API Credentials configured in the Tenant
    aresponse = request(tenant, token, "/web/namespaces/system/api_credentials", "get", "").text
    return json.loads(aresponse)['items']  


def revoke_list():
    revoke = []
    for apicred in apicreds():

        if apicred['user_email'] == user_email or user_email == 'all':
            # print("DEBUG: apiExpirDate = " + apicred['expiry_timestamp'])
            apiExpirDate = datetime.strptime(apicred['expiry_timestamp'][:+23], "%Y-%m-%dT%H:%M:%S.%f")
            # print("DEBUG: apiExpirDate = " + str(apiExpirDate))
            now = datetime.utcnow() 
            expired = apiExpirDate < now
            if expired:
                print("\nExpired: " + str(apiExpirDate) + " Name: " + apicred['name'] + " API Cred: " + apicred['type'] + " User: " + apicred['user_email'])
                revoke.append(apicred['name'])
            else:
                print("\nValid: " + str(apiExpirDate) + " Name: " + apicred['name'] + " API Cred: " + apicred['type'] + " User: " + apicred['user_email'])
    return revoke


def revoke(list):
    for cred in list:
        print("\nWill delete " + cred)
        data = json.dumps({
          "name": cred,
          "namespace": "system"
        })
        approve = input("\nDo you want to revoke this expired credential (y/n): ") or "n"
        if approve == "y":
            rresponse = request(tenant, token, "/web/namespaces/system/revoke/api_credentials", "post", data).text
            print(rresponse)
        else:
            print("\nSkipping this credential.")

revoke(revoke_list())