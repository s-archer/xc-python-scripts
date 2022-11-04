# Author: Stephen Archer
# Date: 04-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script provides a global search thropugh all namespaces to identify:
#  - Load-Balancers using a non-standard WAF policy and...
#  - Load-Balancers without a WAF policy and...
#  - Load-Balancers configured with a WAF exception matching a specific signature ID
#
#  Note that you can search the F5 signature database here, to identify signatures for 
#  specific CVE or vulnerability: https://docs.cloud.f5.com/docs/reference/attack-signatures 

# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json

# Set variables and collect input from user, including token, and the search criteria.  
tenant                  = "my_tenant"
token                   = input("\nEnter F5 XC Token: ")
search_signature        = int(input("\nFind WAF exceptions for this Signature ID (Enter to use demo value): ") or "200003214")
search_waf_policy_name  = input("\nEnter correct corp standard WAF policy name (Enter to use demo value): ") or "my-standard"

# Define the F5 XC API call
def request(rtenant, rtoken, rapi):
    return requests.get('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })

# Send the first API call to get a list of all namespaces configured in the Tenant (defined in variables above)
nresponse = request(tenant, token, "/web/namespaces").text
namespaces = json.loads(nresponse)['items']

# Iterate through all namespaces to get a list of Load-Balancers
for i in namespaces:
    namespace = i["name"]
    print("\nNamespace: " + namespace)
    lresponse = request(tenant, token, "/config/namespaces/" + namespace + "/http_loadbalancers").text
    loadbalancers = json.loads(lresponse)['items']

    # Iterate through all Load-Balancers to get each Load-Balancer config (spec)
    for l in loadbalancers:
        print("\n  LB: " + l["name"])
        lb = request(tenant, token, "/config/namespaces/" + namespace + "/http_loadbalancers/" + l["name"]).text
        lbspec = json.loads(lb)['spec']
        print("    Domain:      " + json.dumps(lbspec['domains']))

        # Check if each Load-Balancer has a WAF Policy enabled
        if "app_firewall" in lb:
            waf_name = json.dumps(lbspec['app_firewall']['name']).replace('"', '')

            #Check if the applied WAF Policy matches your search criteria
            if waf_name != search_waf_policy_name:
                print("   ! Non-Matching WAF enabled: " + waf_name)
            else: 
                print("    WAF enabled: " + waf_name)
            signatures = []

            # Iterate through all WAF Exclusion Rules configured on the Load-Balancer
            for e in lbspec['waf_exclusion_rules']:

                # Iterate through all Signatures contained in the WAF exclusion Rule 
                for s in e['app_firewall_detection_control']['exclude_signature_contexts']:
                    signature = json.dumps(s['signature_id'])
                    signatures.append(signature)

                    # Check each signature to see if it matches your search criteria
                    if signature == search_signature:
                        print("   ! WAF excludes Search Signature: " + signature)

            # If we found some signatures in WAF Exception Rules, print them
            if signatures != []:
                print("    WAF exclude: " + ','.join(signatures))
            else:
                print("    WAF exclude: None")
        # Print warning if no WAF policy is applied to a Load-Balancer
        else:
            print("   ! No WAF on LB")

# End