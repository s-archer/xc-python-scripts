# Author: Stephen Archer
# Date: 16-Jan-2023
#
# For F5 Distributed Cloud Platform
# 
# This script provides a stopgap solution to import DNS zone records into F5 XC Primary zone from CSV file
#
# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json
import jinja2
from jinja2 import Template
import csv

# Set variables and collect input from user, including tenant, token, and the search criteria.  
tenant                  = input("\nEnter F5 XC Tenant : ") or "my-tenant"
token                   = input("\nEnter F5 XC Token  : ") or "my-token"
csvpath                 = input("\nEnter CSV Path     : ") or "test.csv"
zone                    = input("\nEnter F5 XC Zone   : ") or "archf5.com"

# Define the F5 XC API call
def request(rtenant, rtoken, rapi):
    return requests.get('https://' + rtenant +'.console.ves.volterra.io' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })

# Send the first API call to get current config 
zresponse = request(tenant, token, "/api/config/dns/namespaces/system/dns_zones/archf5.com").text
zjson = json.loads(zresponse)

# Write the current config (JSON string) to local file
with open('json_data_string.json', 'w') as outfile:
    outfile.write(zresponse)

def csv_to_json(csv_file_path, json_file_path):

    #create a dictionary
    data_dict = {}
 
    #open a csv file handler
    with open(csv_file_path, encoding = 'utf-8') as csv_file_handler:
        csv_reader = csv.DictReader(csv_file_handler)
 
        # convert each row into a dictionary
        # and add the converted data to the data_variable
 
        for rows in csv_reader:
 
            # assuming a column named 'No'
            # to be the primary key
            key = rows['record_id']
            data_dict[key] = rows
 
    # open a json file handler and use json.dumps
    # method to dump the data
    with open(json_file_path, 'w', encoding = 'utf-8') as json_file_handler:
        json_file_handler.write(json.dumps(data_dict, indent = 4))
    #Jinja2 
    with open('dns-body-template.j2') as file_:
        template = Template(file_.read())
    # data_json = json.dumps(data_dict)
    myzonefile=template.render(rr_list=data_dict)
    print(myzonefile)
    # print(data_dict['38322256']['fqdn'])
    # print(type(data_dict))

csv_to_json(csvpath, "test.json")