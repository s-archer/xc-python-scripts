# options:
#   -h, --help            show this help message and exit
#   --token TOKEN
#   --tenant TENANT # This should be the simple form, as you see in the UI browser URL.
#   --namespace NAMESPACE
#   --loadbalancer LOADBALANCER 
#   --hours HOURS



from datetime import datetime
import argparse
import json
import requests
import pandas as pd 
import sys

def get_securiy_logs(token,tenant,namespace,loadbalancer,hours):

    currentTime = datetime.now()
    midTime = int(round(datetime.timestamp(currentTime)))
    startTime = midTime - (hours*3600)

    while True:
        endTime = midTime
        midTime= endTime - (24*3600)
        if hours < 24:
            midTime=startTime
        BASE_URL = 'https://{}.console.ves.volterra.io/api/data/namespaces/{}/app_security/events'.format(tenant, namespace)
        headers = {'Authorization': "APIToken {}".format(token)}
        try:
            auth_response = requests.post(BASE_URL, data=json.dumps({"aggs": {}, "end_time": "{}".format(endTime), "limit": 0, "namespace": "{}".format(namespace), "query": "{{vh_name=\"ves-io-http-loadbalancer-""{}""\"}}".format(loadbalancer), "sort": "DESCENDING", "start_time": "{}".format(midTime), "scroll":True } ), headers=headers)
            # auth_response = requests.post(BASE_URL, data=json.dumps({"namespace": "demo-app-waap","query": "{vh_name=\"ves-io-demo-app-waap-sentence-api\",sec_event_type=~\"waf_sec_event|l7_policy_sec_event|js_challenge_sec_event|captcha_sec_event\"}","aggs": {},"start_time": "2025-09-27T12:10:00.000Z","end_time": "2025-09-27T13:10:00.000Z"}), headers=headers)
            auth_response.raise_for_status()
        except requests.exceptions.Timeout:
            print("Error: Request timed out")
            sys.exit(1)
        except requests.exceptions.ConnectionError:
            print("Error: Could not connect to server")
            sys.exit(1)
        except requests.exceptions.HTTPError as e:
            print(f"HTTP Error: {e.response.status_code} {e.response.reason}")
            try:
                # Try to show error body if it’s JSON
                print(e.response.json())
            except Exception:
                print(e.response.text)
            sys.exit(1)
        except Exception as e:
            print(f"Unexpected error: {e}")
            sys.exit(1)
        else:
            print("Request succeeded")            
        try:
            securityLogs = auth_response.json()
        except ValueError:
            print("Error: Response was not valid JSON")
            sys.exit(1)
        events = securityLogs['events']
        all_events = []
        if 'events' in securityLogs:
            count = 1
            for event in events:
                item_dict = json.loads(event)
                # print("Parsing number " + str(count))
                # count += 1
                all_events.append(event)
               
            while (securityLogs["scroll_id"]!=""):
                BASE_URL = 'https://{}.console.ves.volterra.io/api/data/namespaces/{}/app_security/events/scroll'.format(tenant,namespace)
                auth_response = requests.post(BASE_URL, data=json.dumps({"namespace": "{}".format(namespace), "scroll_id": "{}".format(securityLogs["scroll_id"]),"scroll":True}), headers=headers)
                securityLogs = auth_response.json()
                events = securityLogs['events']
                for event in events:
                    item_dict = json.loads(event)
                    # print("Parsing number " + str(count))
                    # count += 1
                    all_events.append(event)
  
        hours=hours-24
        if hours<24:
            break
        
    return all_events


def main():
    currentTime = datetime.now()
    parser = argparse.ArgumentParser(description = "This *Python* script helps to export the Security Events logs from *F5 Distributed Cloud* via the XC API into a CSV file.", epilog='The script generates a CSV file named as: xc-security_events-<TENANT>_<NAMESPACE>-<date>.csv')    
    parser.add_argument('--token', type=str, required=True)
    parser.add_argument('--tenant', type=str, required=True)
    parser.add_argument('--namespace', type=str, required=True)
    parser.add_argument('--loadbalancer', type=str, required=True)
    parser.add_argument('--hours', type=int, required=True)
    args = parser.parse_args()

    security_logs = get_securiy_logs(args.token,args.tenant,args.namespace,args.loadbalancer,args.hours)
    with open("output.json", "w") as f:
        json.dump(security_logs, f, indent=2)

if __name__ == "__main__":
   main()