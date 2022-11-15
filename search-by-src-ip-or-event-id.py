# Author: Stephen Archer
# Date: 14-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script provides a global search thropugh all namespaces to identify either:
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
start_date              = input("\nEnter the UTC start DATE for your search window [YYYY-MM-DD]: ") or "2022-11-13"
start_time              = input("\nEnter the UTC start TIME for your search window [HH-MM-SS]: ") or "23:00:00"
end_date                = input("\nEnter the UTC start DATE for your search window [YYYY-MM-DD]: ") or "2022-11-14"
end_time                = input("\nEnter the UTC start TIME for your search window [HH-MM-SS]: ") or "14:18:00"
while True:
    search_type         = input("\nDo you want to search by IP Address or Blocking ID? [ip|id]: ")
    if search_type.lower() not in ('ip', 'id'):
        print("Please enter \"ip\" or \"id\"")
        continue
    elif search_type.lower() == "ip":
        search_ip       = input("\nEnter the IP you are searching for: ") or "20.30.40.50"
        break
    else:
        search_id       = input("\nEnter the Blcoking ID you are searching for: ") or "my-blocking-id"
        break


# Create a correctly formatted UTC timestamp 
start_timestamp = start_date + "T" + start_time + "Z" 
end_timestamp   = end_date + "T" + end_time + "Z"


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


def events(type, search_arg):
    
    body = json.dumps({
        "query": "{" + type + "=\"" + search_arg + "\",sec_event_type=~\"waf_sec_event|bot_defense_sec_event|api_sec_event|svc_policy_sec_event\"}",
        "aggs": {},
        "start_time": start_timestamp,
        "end_time":   end_timestamp,
        "limit": "2"
    })

    # Iterate through all namespaces to search for security events matching the input IP in each
    for namespace in namespaces():
        print("\nNamespace: " + namespace['name'])
        response = json.loads(request(tenant, token, "/data/namespaces/" + namespace['name'] + "/app_security/events", "post", body).text)
        for event in response['events']:
            eventjson = json.loads(event)
            if search_type == "ip":
                print("\n\t" + eventjson.get('domain') + " LB blocked IP: " + search_ip + ". Request ID: " + eventjson.get('req_id'))
            else:
                print("\n\t" + eventjson.get('domain') + " LB blocked ID: " + search_id + ". Source IP: " + eventjson.get('src_ip'))


if search_type.lower() == "ip":
    events("src_ip", search_ip)
else:
    events("req_id", search_id)
    
print("\nFinished\n")