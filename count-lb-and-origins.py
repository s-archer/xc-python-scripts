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

# Iterate through all namespaces to get a list of Load-Balancers
for i in namespaces:
    namespace = i["name"]
    # print("\nNamespace: " + namespace)
    lresponse = request(tenant, token, "/config/namespaces/" + namespace + "/http_loadbalancers").text
    loadbalancers = json.loads(lresponse)['items']
    lbcount = 0
    ogresponse = request(tenant, token, "/config/namespaces/" + namespace + "/origin_pools").text
    origins = json.loads(ogresponse)['items']
    ogcount = 0
    # Iterate through all Load-Balancers to get each Load-Balancer config (spec)
    for l in loadbalancers:
        # print("\n  LB: " + l["name"])
        lb = request(tenant, token, "/config/namespaces/" + namespace + "/http_loadbalancers/" + l["name"]).text
        lbspec = json.loads(lb)['spec']
        # print("    Domain:      " + json.dumps(lbspec['domains']))
        lbcount += 1
    for o in origins:
        # print("\n  LB: " + l["name"])
        og = request(tenant, token, "/config/namespaces/" + namespace + "/origin_pools/" + o["name"]).text
        ogspec = json.loads(og)['spec']
        # print("    Domain:      " + json.dumps(lbspec['domains']))
        ogcount += 1
    if lbcount > 10 or ogcount > 10:
        print("\nNamespace: " + namespace + " count LB     = " + str(lbcount))
        print("\nNamespace: " + namespace + " count Origin = " + str(ogcount))
# End