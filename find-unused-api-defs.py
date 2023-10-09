# Author: Stephen Archer
# Date: 04-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script provides a global search thropugh all namespaces to identify:
#  - Load-Balancers using api definition and...
#  - api definitions not currently used.

# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json

# Set variables and collect input from user, including tenant, token, and the search criteria.  
tenant                  = input("\nEnter F5 XC Tenant: ") or "my-tenant"
token                   = input("\nEnter F5 XC Token: ") or "my-token"

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
    aresponse = request(tenant, token, "/config/namespaces/" + namespace + "/api_definitions").text
    api_definitions = json.loads(aresponse)['items']
    print("\nNamespace: " + namespace)

    # Print all API Definitions
    for a in api_definitions:
        print("\n  API Def: " + namespace + " " + a["name"])

    # Iterate through all Load-Balancers to get each Load-Balancer config (spec)
    for l in loadbalancers:
        # print("\n  LB: " + l["name"])
        lb = request(tenant, token, "/config/namespaces/" + namespace + "/http_loadbalancers/" + l["name"]).text
        lbspec = json.loads(lb)['spec']
        # print("    Domain:      " + json.dumps(lbspec['domains']))

        # Check if each Load-Balancer has a API Definition enabled
        if "api_specification" in lb:
            print("\n  LB: " + l["name"])
            print("    Domain:      " + json.dumps(lbspec['domains']))
            apidef_name = json.dumps(lbspec['api_specification']['api_definition']['name'])
            apidef_namespace = json.dumps(lbspec['api_specification']['api_definition']['namespace'])
            print("    API Definition: " + apidef_namespace + apidef_name)
        # else:
        #     print("   ! No API Definition")