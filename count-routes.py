# Author: Stephen Archer
# Date: 04-Nov-2023
#
# For F5 Distributed Cloud Platform
# 
# This script provides a global search thropugh all namespaces to identify:
#  - Load-Balancers using a non-standard WAF policy and...
#  - Origins
#

# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json

# Set variables and collect input from user, including tenant, token.  
tenant                  = input("\nEnter F5 XC Tenant: ") or "<my-tenant>"
token                   = input("\nEnter F5 XC Token: ") or "<my-tokjen>"

# Define the F5 XC API call
def request(rtenant, rtoken, rapi):
    return requests.get('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })

# Send the first API call to get a list of all namespaces configured in the Tenant (defined in variables above)
nresponse = request(tenant, token, "/web/namespaces").text
namespaces = json.loads(nresponse)['items']

# Iterate through all namespaces to get a list of routes
for i in namespaces:
    namespace = i["name"]
    print("\nNamespace: " + namespace)
    rresponse = request(tenant, token, "/config/namespaces/" + namespace + "/routes").text
    routes = json.loads(rresponse)['items']
    rcount = 0
    for r in routes:
        print("\n  Route: " + r["name"])
        rcount += 1
    if rcount > 10:
        print("\nNamespace: " + namespace + " count Route     = " + str(rcount))
# End