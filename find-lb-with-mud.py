# Author: Stephen Archer
# Date: 04-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script provides a global search thropugh all namespaces to identify:
#  - Load-Balancers using api specification and...
#  - api validation ENABLED.

# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json

# Set variables and collect input from user, including tenant, token, and the search criteria.  
tenant                  = input("\nEnter F5 XC Tenant: ") or "TENANT"
token                   = input("\nEnter F5 XC Token: ") or "TOKEN"

# Define the F5 XC API call
def request(rtenant, rtoken, rapi):
    return requests.get('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })

# Send the first API call to get a list of all namespaces configured in the Tenant (defined in variables above)
nresponse = request(tenant, token, "/web/namespaces").text
namespaces = json.loads(nresponse)['items']

# Iterate through all namespaces to get a list of Load-Balancers
for i in namespaces:
    namespace = i["name"]
    lresponse = request(tenant, token, "/config/namespaces/" + namespace + "/http_loadbalancers").text
    loadbalancers = json.loads(lresponse)['items']
    # print("\nNamespace: " + namespace)

    # Iterate through all Load-Balancers to get each Load-Balancer config (spec)
    for l in loadbalancers:
        # print("\n  LB: " + l["name"])
        lb = request(tenant, token, "/config/namespaces/" + namespace + "/http_loadbalancers/" + l["name"]).text
        lbspec = json.loads(lb)['spec']
        # print("    Domain:      " + json.dumps(lbspec['domains']))

        # Check if each Load-Balancer has MUD enabled
        if "enable_malicious_user_detection" in lb:
            print("\nNamespace : " + namespace)
            print("\n  LB      :  " + l["name"])
            print("\n    MUD   :   ENABLED")