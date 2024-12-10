This script reads the input file `health-check-ascii.txt` which must contain a valid ascii formatted HTTP request.  It encodes the request as hex so it can be used in an F5 XC TCP Health Check.

Set variable for the health check input file.  

`input_file_name = "health-check-ascii.txt"`

It should have content similar to this:

<code>
POST /api/locations HTTP/1.1
Host: host.example.com
Connection: Keep-Alive
Content-Length: <will be calculated>
User-Agent: F5-XC-Healthcheck
Content-Type: application/json
Accept: */*
Accept-Encoding: gzip, deflate

Body: {"value":"cave"}
</code>

NOTE that the body line has prefixed a variable named "Body: ".  This is 
not valid HTTP, but is required for this script.  Set 'Body:' to null (blank) if creating a GET request.


Also, if you want the script to send the request to the server to test tye response, modify the the variable:

`lb_domain_for_testing = "test-lb.example.com"`
