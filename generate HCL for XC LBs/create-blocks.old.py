def generate_block_name(index):
    name = ""
    while index >= 0:
        name = chr(index % 26 + 97) + name
        index //= 26
        index -= 1
    return name

def generate_hcl_code(num_customers, number_of_blocks):
    hcl_codes = []
    for block_index in range(number_of_blocks):
        block_name = generate_block_name(block_index)
        hcl_code = f"locals {{\n    routes-{block_name} = [\n"
        for i in range(1, num_customers + 1, 8):
            customers = [f"customer-{block_name}-{j}" for j in range(i, min(i + 8, num_customers + 1))]
            customer_str = "|".join(customers)
            hcl_code += "        {\n"
            hcl_code += f'            regex = "^(api|rest|this)-({customer_str})\\\\.archf5\\\\.com$"\n'
            hcl_code += "        },\n"

        hcl_code += "    ]\n"
        hcl_code += "}\n"
        hcl_codes.append(hcl_code)
    return hcl_codes

def write_to_file(filename, content):
    with open(filename, "w") as file:
        for i, block_content in enumerate(content):
            file.write(f"# Block {generate_block_name(i)}\n")
            file.write(block_content)
            file.write("\n\n")

def write_custom_route_blocks(filename, block_names):
    with open(filename, "w") as file:
        for block_name in block_names:
            file.write(generate_custom_route_block(block_name))
            file.write("\n\n")


def write_lb_route_blocks(filename, block_names):
    with open(filename, "w") as file:
        for block_name in block_names:
            file.write(block_name)
            # file.write("\n")


def generate_custom_route_block(block_name):
    return f'''
resource "volterra_route" "ipparking-route-{block_name}" {{
  name      = "ipparking-route-tf-{block_name}"
  namespace = var.namespace

  dynamic "routes" {{
    for_each = local.routes-{block_name}
    content {{
      match {{
        http_method = "ANY"
        path {{
          prefix = "/"
        }}
        headers {{
          name = "Host"
          regex = routes.value.regex
        }}
      }}
      route_destination {{
        auto_host_rewrite = true
        timeout           = 3600
        destinations {{
          cluster {{
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }}
          weight = 1
        }}
      }}
    }}
  }}
}}
'''

def generate_lb_route_block(block_name):
    return f'''
  routes {{
    custom_route_object {{
      route_ref {{
        name      = volterra_route.ipparking-route-{block_name}.name
        namespace = var.namespace
      }}
    }}
  }}
'''

# Test with 4 customers and 3 blocks
num_customers = 8
number_of_blocks = 200
hcl_codes = generate_hcl_code(num_customers, number_of_blocks)
write_to_file("output.tf", hcl_codes)


# Generate and write resource blocks to a separate file
custom_route_block_names = [generate_block_name(i) for i in range(number_of_blocks)]
write_custom_route_blocks("custom_route_blocks.tf", custom_route_block_names)


# Generate and write lb route blocks to a separate file
lb_route_block_names = [generate_lb_route_block(generate_block_name(i)) for i in range(number_of_blocks)]
write_lb_route_blocks("lb_route_blocks.tf", lb_route_block_names)
