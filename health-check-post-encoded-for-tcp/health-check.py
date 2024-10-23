# This script reads the input file which must contain a valid ascii formatted
#  HTTP request.  It encodes the request as hex so it can be used in an F5 XC
#  TCP Health Check.
#
# Set variable for the health check input file.  It should have content similar to this:
# 
# POST /api/sentence/locations HTTP/1.1
# Host: sentence.local
# Connection: Keep-Alive
# Content-Length: <will be calculated>
# User-Agent: F5-XC-Healthcheck
# Content-Type: application/json
# Accept: */*
# Accept-Encoding: gzip, deflate

# Body: {"value":"cave"}

# NOTE that the body line has prefixed a variable named "Body: ".  This is 
# not valid HTTP, but is required.


input_file_name = "health-check-ascii.txt"
lb_domain_for_testing = "test-lb.example.com"

import socket

# Read the HTTP request from the file
with open(input_file_name, "r") as file:
    http_request = file.read()

# Split the request into lines
lines = http_request.splitlines()

updated_lines = []
request_body = ""
content_length = None

print("------------------------------------------------------------------------------------------\r\n")

# Process each line one at a time
for line in lines:
    # The folowing 7 lines should ensure that any hidden LF/CRLF characters are removed.
    print("Original string                            :  " + line)
    print("Raw original string show escape characters : " + repr(line))
    line = line.replace('\\r', '\r').replace('\\n', '\n')
    line = line.rstrip('\r\n')
    line = line + '\r\n'
    print("Modified string                            :  " + line)
    print("Modified string show escape characters     : " + repr(line))
    if line.startswith("Body:"):
        request_body += line.removeprefix("Body: ") # Collecting the body content
        content_length = len(request_body.encode('utf-8')) # Calculating the length of the body in bytes
    else:
        if line.startswith("Content-Length:"):
            # Update the Content-Length after collecting the body
            print("\r\n------------------------------------------------------------------------------------------\r\n")
            continue
        updated_lines.append(line)
    print("\r\n------------------------------------------------------------------------------------------\r\n")


# Insert the correct Content-Length header
updated_lines.insert(2, f"Content-Length: {content_length}\r\n")  # Adding content length header

# Rebuild the HTTP request from updated_lines
http_request = ''.join(updated_lines)

# Add the extra CRLF if it is missing before the body
if not http_request.endswith("\r\n\r\n"):
    http_request += "\r\n"

# Add the body to the request
http_request += request_body
print('\r\nHTTP Request: \r\n\r\n'+ http_request)

# Convert the HTTP request to hex
http_request_hex = http_request.encode("utf-8").hex()
http_request_bytes = bytes.fromhex(http_request_hex)

# Print the hex string
print('\r\nHTTP Request (hex): \r\n\r\n'+ http_request_hex)

# Send the HTTP request using sockets
host = lb_domain_for_testing
port = 80

# Uncomment to send the request
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((host, port))
    s.sendall(http_request_bytes)  # Send the bytes instead of the encoded string
    response = s.recv(4096)


# Print the decoded server response
print("\r\nResponse from server (decoded):\r\n")
print(response.decode("utf-8"))

# Print the response from the server in hex
response_hex = response.hex()  # Convert the response bytes to hex
print("\r\nResponse from server (hex):\r\n")
print(response_hex)