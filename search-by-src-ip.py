# Author: Stephen Archer
# Date: 14-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script provides a global search thropugh all namespaces to identify:
#  - Load-Balancers configured with WAF, blocking a specific IP address, during a specific time window
#
# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json


# Set variables and collect input from user, including tenant, token, and the search criteria.  
tenant                  = input("\nEnter F5 XC Tenant: ") or "my-tenant"
token                   = input("\nEnter F5 XC Token: ") 
search_ip               = input("\nEnter the IP you are searching for: ") or "100.10.20.20"
start_date              = input("\nEnter the UTC start DATE for your search window [YYYY-MM-DD]: ") or "2022-11-13"
start_time              = input("\nEnter the UTC start TIME for your search window [HH-MM-SS]: ") or "23:00:00"
end_date                = input("\nEnter the UTC start DATE for your search window [YYYY-MM-DD]: ") or "2022-11-14"
end_time                = input("\nEnter the UTC start TIME for your search window [HH-MM-SS]: ") or "14:18:00"


# create a correctly formatted UTC timestamp 
start_timestamp = start_date + "T" + start_time + "Z" 
end_timestamp   = end_date + "T" + end_time + "Z"


# Define the JSON body format for request to get events
body = json.dumps({
  "query": "{src_ip=\"" + search_ip + "\",sec_event_type=~\"waf_sec_event|bot_defense_sec_event|api_sec_event|svc_policy_sec_event\"}",
  "aggs": {},
  "start_time": start_timestamp,
  "end_time":   end_timestamp,
  "limit": "2"
})

# Define the F5 XC API call
def request(rtenant, rtoken, rapi, rmethod, rdata):
    if rmethod == "post":
        return requests.post('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken }, data=rdata)
    elif rmethod == "get":
        return requests.get('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })
    else:
        print("Incorrect method")

# Send the first API call to get a list of all namespaces configured in the Tenant (defined in variables above)
nresponse = request(tenant, token, "/web/namespaces", "get", "").text
namespaces = json.loads(nresponse)['items']


# Iterate through all namespaces to search for security events matching the input IP in each
for namespace in namespaces:
    print("\nNamespace: " + namespace['name'])
    eresponse = json.loads(request(tenant, token, "/data/namespaces/" + namespace['name'] + "/app_security/events", "post", body).text)
    for event in eresponse['events']:
        eventjson = json.loads(event)
        print("\n\t" + eventjson.get('domain') + " LB blocked IP: " + search_ip + ". Request ID: " + eventjson.get('req_id'))