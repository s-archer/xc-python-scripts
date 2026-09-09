# Author: Stephen Archer
# Date: 01-Nov-2022
# Updated (vibe coded): 09-Sep-2026

# For F5 Distributed Cloud Platform

# This script is designed to help you identify appropriate roles that allow your users to perform specific operations on the F5 Distributed Cloud Platform (F5 XC).  
# The starting point is to identify the API endpoint that you want to allow your users to access, and the methods (GET, POST, DELETE, PUT) that you want to allow 
# on those endpoints.  You need to input 'SEARCH_TERMS' that allow you to identify the API endpoints that you want to allow your users to access (e.g 'loadbalancer').  

# The script will then output a list of matching API endpoints and the methods allowed by the platform.  You can then select the desired API endpoints from the list 
# and the script will output the discovered Roles, API Groups and API Endpoints that relate to the chosen endpoint and methods.

# This link explains how to obtain an API token: (https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials#generate-api-tokens.  

import requests
import json
import argparse
import re

# ==================== EDIT YOUR SETTINGS HERE ====================
# Connection defaults: press Enter at the prompts to use these values.
DEFAULT_TENANT = 'my-tenant'
DEFAULT_TOKEN = 'my-token'

# Endpoint search: matches any of these text fragments in an API path.
# You can then select specific endpoints from the numbered results output by the script.
SEARCH_TERMS = ['http_loadbalancers']

# Optional method default: e.g. ["GET"] or ["GET", "POST"], ["GET", "POST", "DELETE", "PUT"].
# Leave empty to require a method selection each run.
# Roles must allow exactly these methods on every selected endpoint.
DEFAULT_METHODS = ["GET"]
# ==================== END OF EDITABLE SETTINGS ====================

# Setup and input validation below; normally no edits required.
parser = argparse.ArgumentParser(description="Find API groups and roles by path and methods.")
parser.add_argument("--verbose", action="store_true", help="Show original endpoint patterns during selection.")
verbose = parser.parse_args().verbose

search_list = list(SEARCH_TERMS)
method_order = ("GET", "POST", "DELETE", "PUT")
supported_methods = set(method_order)


def ordered_methods(methods):
    return [method for method in method_order if method in methods]


def read_methods(prompt, required=False):
    while True:
        raw = input(prompt).strip()
        methods = list(dict.fromkeys(raw.upper().replace(",", " ").split())) if raw else list(DEFAULT_METHODS)
        if (methods or not required) and set(methods) <= supported_methods:
            return ordered_methods(methods)
        print("Enter one or more of GET, POST, DELETE or PUT, separated by commas or spaces.")


if not SEARCH_TERMS or not all(isinstance(term, str) and term.strip() for term in SEARCH_TERMS):
    raise SystemExit("SEARCH_TERMS must contain at least one non-empty search string.")
if not isinstance(DEFAULT_METHODS, list) or not all(method in supported_methods for method in DEFAULT_METHODS):
    raise SystemExit("DEFAULT_METHODS must be a list containing only GET, POST, DELETE or PUT.")

tenant = input(f"\nEnter F5 XC Tenant [{DEFAULT_TENANT}]: ").strip() or DEFAULT_TENANT
token = input("\nEnter F5 XC Token (Enter to use configured default): ").strip() or DEFAULT_TOKEN
method_default = f" [default: {', '.join(ordered_methods(DEFAULT_METHODS))}]" if DEFAULT_METHODS else ""
allowed_methods = read_methods(f"\nRequested methods (e.g. GET, PUT){method_default}: ", required=True)

# Define the F5 XC API call
def request(rtenant, rtoken, rapi, rmethod, rdata):
    if rmethod == "post":
        return requests.post('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken }, data=rdata)
    elif rmethod == "get":
        return requests.get('https://' + rtenant +'.console.ves.volterra.io/api' + rapi, headers={ 'Authorization': 'APIToken ' + rtoken })
    else:
        print("Incorrect method")
        return None

# Helper to check response for general errors and specifically authentication/authorization issues
def check_response(response, context_name):
    if response is None:
        print(f"Error: No response received for {context_name}.")
        return False
    # Specific check for 401 Unauthorized
    if response.status_code == 401:
        print(f"\n[AUTH ERROR] 401 Unauthorized: The provided token is invalid or expired for tenant '{tenant}'.")
        return False
    # Specific check for 403 Forbidden
    elif response.status_code == 403:
        print(f"\n[AUTH ERROR] 403 Forbidden: The token does not have permissions to access '{context_name}'.")
        return False
    elif response.status_code != 200:
        print(f"Error fetching {context_name}: HTTP {response.status_code} - {response.text}")
        return False
    return True

def fetch_items(path, context_name):
    response = request(tenant, token, path, "get", "")
    if not check_response(response, context_name):
        raise RuntimeError(f"Cannot complete permission search: {context_name} unavailable.")
    try:
        return json.loads(response.text)["items"]
    except (json.JSONDecodeError, KeyError, TypeError) as exc:
        raise RuntimeError(f"Invalid response for {context_name}.") from exc


selected_endpoints = []


def display_endpoint(path):
    # Shorten only the known resource-name pattern; retain other regex syntax.
    name_pattern = "([a-z]([-a-z0-9]*[a-z0-9])?)"
    # Remove punctuation escapes for display only, preserving regex tokens like \d.
    label = re.sub(r"\\([^A-Za-z0-9])", r"\1", path)
    label = label.removeprefix("^").removesuffix("$")
    label = label.replace("/namespaces/" + name_pattern, "/namespaces/{namespace}")
    return label.replace(name_pattern, "{name}")


def select_endpoints(paths):
    print("\nMatching endpoints:")
    ordered = sorted(paths, key=lambda path: (display_endpoint(path), len(paths[path]), path))
    endpoint_width = max((len(display_endpoint(path)) for path in ordered), default=0)
    number_width = len(str(len(ordered)))
    for number, path in enumerate(ordered, 1):
        methods = ", ".join(ordered_methods(paths[path]))
        print(f"  {number:>{number_width}}. {display_endpoint(path):<{endpoint_width}}  | {methods}")
        if verbose:
            print("     Pattern: " + path)
    while True:
        selection = input("\nSelect endpoints (e.g. 1,2 or 1-3 or all): ").strip().lower()
        if selection == "all":
            return ordered
        try:
            indices = set()
            for part in selection.replace(",", " ").split():
                bounds = part.split("-")
                if len(bounds) == 1:
                    start = end = int(bounds[0])
                elif len(bounds) == 2:
                    start, end = map(int, bounds)
                else:
                    raise ValueError
                if not 1 <= start <= end <= len(ordered):
                    raise ValueError
                indices.update(range(start, end + 1))
            if indices:
                return [ordered[index - 1] for index in sorted(indices)]
        except ValueError:
            pass
        print("Choose valid endpoint numbers, ranges, or all.")


def empty_permissions():
    return {term: set() for term in selected_endpoints}


def combine_permissions(names, permissions_by_name):
    combined = empty_permissions()
    for name in dict.fromkeys(names):
        permissions = permissions_by_name.get(name) or {}
        for term in selected_endpoints:
            if combined[term] != supported_methods:
                combined[term].update(permissions.get(term, set()) & supported_methods)
        if all(methods == supported_methods for methods in combined.values()):
            break
    return combined


def get_api_group_elements():
    print(f"\nSearching paths {search_list}: requested {allowed_methods}")
    print("Reporting discovered GET, POST, DELETE and PUT grants only.")
    items = fetch_items("/web/namespaces/system/api_group_elements?report_fields", "API group elements")
    elements = {}
    candidates = {}
    paths = {}
    for item in items:
        name = item.get("name")
        spec = item.get("get_spec") or {}
        path = spec.get("path_regex")
        methods = spec.get("methods")
        if not name or not path or not isinstance(methods, list):
            continue
        methods = set(methods) & supported_methods
        if methods and any(term in path for term in search_list):
            candidates[name] = (path, methods)
            paths.setdefault(path, set()).update(methods)
    if not paths:
        print("No endpoints match the search criteria.")
        raise SystemExit(0)
    selected_endpoints[:] = select_endpoints(paths)
    for name, (path, methods) in candidates.items():
        if path in selected_endpoints:
            permissions = empty_permissions()
            permissions[path].update(methods)
            elements[name] = permissions
    return elements


def get_api_groups(elements):
    items = fetch_items("/web/namespaces/system/api_groups?report_fields", "API groups")
    groups = {}
    for group in items:
        name = group.get("name")
        references = (group.get("get_spec") or {}).get("elements")
        if not name or not isinstance(references, list):
            continue
        names = sorted({ref.get("name") for ref in references if isinstance(ref, dict) and ref.get("name") in elements})
        groups[name] = combine_permissions(names, elements)
    return groups


def get_roles(groups):
    items = fetch_items("/web/custom/namespaces/system/roles", "roles")
    requested = set(allowed_methods)
    buckets = {}
    matched_roles = set()
    for role in items:
        name = role.get("name")
        references = role.get("api_groups")
        if not name or not isinstance(references, list):
            continue
        references = sorted({ref for ref in references if isinstance(ref, str)})
        permissions = combine_permissions(references, groups)
        # Check the complete role grant, so another group cannot add unwanted methods.
        if not all(requested == permissions[term] for term in selected_endpoints):
            continue
        contributing = tuple(ref for ref in references if any((groups.get(ref) or {}).values()))
        # Roles sharing contributing groups share the same selected endpoint grants.
        buckets.setdefault(contributing, set()).add(name)
        matched_roles.add(name)

    print("\nMatching roles and their API permissions:")
    for references, roles in sorted(buckets.items(), key=lambda item: tuple(sorted(item[1]))):
        print("\nRoles with identical matching permissions")
        print("├── Roles")
        role_names = sorted(roles)
        for index, name in enumerate(role_names):
            branch = "└── " if index == len(role_names) - 1 else "├── "
            print("│   " + branch + name)
        print("└── Shared API permissions")
        for index, group_name in enumerate(references):
            last_group = index == len(references) - 1
            print("    " + ("└── " if last_group else "├── ") + "API Group: " + group_name)
            endpoints = sorted(
                ((path, groups[group_name][path]) for path in selected_endpoints if groups[group_name][path]),
                key=lambda item: (display_endpoint(item[0]), item[0]),
            )
            method_width = max(len(", ".join(ordered_methods(methods))) for _, methods in endpoints)
            for endpoint_index, (path, methods) in enumerate(endpoints):
                prefix = "    " + ("    " if last_group else "│   ")
                branch = "└── " if endpoint_index == len(endpoints) - 1 else "├── "
                method_label = ", ".join(ordered_methods(methods))
                print(f"{prefix}{branch}{method_label:<{method_width}}  {display_endpoint(path)}")
    if not buckets:
        print("None found.")
    return sorted(matched_roles)


try:
    get_roles(get_api_groups(get_api_group_elements()))
except RuntimeError as exc:
    print(str(exc))
    raise SystemExit(1)
