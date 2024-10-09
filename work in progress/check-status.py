# Author: Stephen Archer
# Date: 14-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script provides a search thropugh all API tokens:
#  - Load-Balancers configured with WAF, blocking a specific IP address (src_ip), during a specific time window, or...
#  - Load-Balancers configured with WAF, blocking a specific Blocking ID (req_id), during a specific time window, or...
#
# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json


# Set variables and collect input from user, including tenant, token, and the search criteria 
# Change values after 'or' to real values, for faster testing (just hit enter instead of manual inputs).  
tenant                  = input("\nEnter F5 XC Tenant: ") or "my-tenant"
token                   = input("\nEnter F5 XC Token: ") or "my-token"

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


# Get the status of all load balancers in all namespaces
lb_status_dict = {}
for namespace in namespaces():
    print("\nNamespace: " + namespace['name'])
    namespace_name = namespace['name']
    # lb_status_dict[tuple([namespace_name])] = {}
    # try:
    #     lb_response = request(tenant, token, "/config/namespaces/" + namespace_name +"/http_loadbalancers/", "get", "").text
    #     lb_data = json.loads(lb_response)
    #     print(lb_data)
    # except ValueError:
    #     print("Error decoding LB response content for namespace '{}':\n".format(namespace_name), lb_response)
    #     exit()
    # for lb in lb_data["items"]:
    #     lb_status_dict[tuple([namespace_name])][lb["name"]] = lb["status"]["operational_status"]

# Output the LB status as a JSON dict
print(json.dumps(lb_status_dict, indent=4))