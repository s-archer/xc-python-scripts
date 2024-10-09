def generate_hcl_code(num_customers):
    hcl_code = "locals {\n"
    hcl_code += "    routes = [\n"

    for i in range(1, num_customers + 1, 8):
        customers = [f"customer{j}" for j in range(i, min(i + 8, num_customers + 1))]
        customer_str = "|".join(customers)
        hcl_code += "        {\n"
        hcl_code += f'            regex = "^(api|rest|this)-({customer_str})\\\\.archf5\\\\.com$"\n'
        hcl_code += "        },\n"

    hcl_code += "    ]\n"
    hcl_code += "}\n"

    return hcl_code

def write_to_file(filename, content):
    with open(filename, "w") as file:
        file.write(content)

# Test with 500 customers
num_customers = 2048
hcl_code = generate_hcl_code(num_customers)
write_to_file("output_customers.tf", hcl_code)