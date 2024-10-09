# Author: Stephen Archer
# Date: 01-Nov-2022
#
# For F5 Distributed Cloud Platform
# 
# This script will iterate through a list (SEARCH_LIST) of API path 'parts' that uniquely identify APIs that you need access to, 
#  to find matching API Group Elements and finally match the found Element to an API Group.
#  You can then add API Groups to a Role in Volterra.
#
# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json


# Set variables and collect input from user, including tenant, token, and the search criteria 
# Change values after 'or' to real values, for faster testing (just hit enter instead of manual inputs).  
tenant                  = input("\nEnter F5 XC Tenant: ") or "<my-tenant>"
token                   = input("\nEnter F5 XC Token: ") or "<my-token>"

search_list=["gen-ai"]

# Define the F5 XC API call
def request(rtenant, rtoken, rapi, rmethod, rdata):
    if rmethod == "post":
        return requests.post('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken }, data=rdata)
    elif rmethod == "get":
        return requests.get('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })
    else:
        print("Incorrect method")

# Get the list of API Group Elements and return a list of those whose API endpoint URL regex contains your search criteria e.g. 'access_log'
def get_api_group_elements():
    # Send the first API call to get a list of all api group elements
    print("\nSearching for API Group Elements that match your criteria " + " '" + ' '.join(search_list) + "' " + "...\n")
    aresponse = request(tenant, token, "/web/namespaces/system/api_group_elements?report_fields", "get", "").text
    elements_match = []
    for item in json.loads(aresponse)['items']:
        # print(item["get_spec"]["path_regex"])
        for s in search_list:
            if s in item["get_spec"]["path_regex"]:
                elements_match.append(item["name"])
                print("Searched for " + s + " and matched: " + item["get_spec"]["path_regex"] + " name = " + item["name"])
    return sorted(set(elements_match))


# Get the list of API Groups that contain the API Group Elements that match your search criteria
def get_api_groups(elements_match):
    # Send the first API call to get the list api groups
    print("\nSearching API Groups...\n")
    gresponse = request(tenant, token, "/web/namespaces/system/api_groups?report_fields", "get", "").text
    groups_match = []
    for group in json.loads(gresponse)['items']:
        # print("Group name = " + group["name"])
        # print(group["get_spec"]["elements"])
        # print(group["get_spec"]["elements"])
        for elements in group["get_spec"]["elements"]:
            # print("Element name = " + elements["name"])
            for match in elements_match:
                # print("Match = " + match)
                if match == elements["name"]:
                    print("Matching API Group found: " + group["name"])
                    groups_match.append(group["name"])
    return sorted(set(groups_match))


def get_roles(groups_match):
    # Send the first API call to get the list of roles
    print("\nSearching Roles...\n")
    rresponse = request(tenant, token, "/web/custom/namespaces/system/roles", "get", "").text
    roles_match = []
    for role in json.loads(rresponse)['items']:
        # print("Role name = " + role["name"])
        # print(role["api_groups"])
        for group in role["api_groups"]:
            # print(group)
            for match in groups_match:
                # print(group + " " + match)
                if group in match:
                    print("Matching Role found: " + role["name"])
                    roles_match.append(role["name"])
    print("\nIdentified the following roles that match your criteria: \n")
    for matched_role in sorted(set(roles_match)):
        print("Role: " + matched_role)
    return sorted(set(roles_match))

get_roles(get_api_groups(get_api_group_elements()))