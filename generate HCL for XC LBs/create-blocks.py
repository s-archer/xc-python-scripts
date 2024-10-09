def generate_block_suffix(index):
    name = ""
    while index >= 0:
        name = chr(index % 26 + 97) + name
        index //= 26
        index -= 1
    return name

# def generate_hcl_code(num_customers, number_of_blocks):
#     hcl_codes = []
#     for block_index in range(number_of_blocks):
#         block_suffix = block_index
#         hcl_code = f"locals {{\n    routes-{block_suffix} = [\n"
#         for i in range(1, num_customers + 1, 8):
#             customers = [f"customer-{block_suffix}-{j}" for j in range(i, min(i + 8, num_customers + 1))]
#             customer_str = "|".join(customers)
#             hcl_code += "        {\n"
#             hcl_code += f'            regex = "^[a-zA-Z0-9-.]*-({customer_str})\\\\.archf5\\\\.com$"\n'
#             hcl_code += "        },\n"

#         hcl_code += "    ]\n"
#         hcl_code += "}\n"
#         hcl_codes.append(hcl_code)
#     return hcl_codes

def generate_hcl_code(num_customers, number_of_blocks):
    hcl_codes = []
    for block_index in range(number_of_blocks):
        block_suffix = block_index
        hcl_code = f"locals {{\n    routes-{block_suffix} = [\n"
        for i in range(1, num_customers + 1):
            customer = f"customer-{block_suffix}-{i}"
            hcl_code += "        {\n"
            hcl_code += f'            regex = "^[a-zA-Z0-9-.]*-({customer})\\\\.archf5\\\\.com$"\n'
            hcl_code += "        },\n"

        hcl_code += "    ]\n"
        hcl_code += "}\n"
        hcl_codes.append(hcl_code)
    return hcl_codes


def write_to_file(filename, content):
    with open(filename, "w") as file:
        for i, block_content in enumerate(content):
            file.write(f"# Block for Server {(i)}\n")
            file.write(block_content)
            file.write("\n\n")

def write_custom_route_blocks(filename, block_suffixes):
    with open(filename, "w") as file:
        for block_suffix in block_suffixes:
            file.write(generate_custom_route_block(block_suffix))
            file.write("\n\n")


def write_lb_route_blocks(filename, block_suffixes):
    with open(filename, "w") as file:
        for block_suffix in block_suffixes:
            file.write(block_suffix)
            # file.write("\n")


def generate_custom_route_block(block_suffix):
    return f'''
resource "volterra_route" "ipp-routes-to-server-{block_suffix}" {{
  name      = "ipp-routes-to-server-{block_suffix}"
  namespace = var.namespace

  dynamic "routes" {{
    for_each = local.routes-{block_suffix}
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

def generate_lb_route_block(block_suffix):
    return f'''
  routes {{
    custom_route_object {{
      route_ref {{
        name      = volterra_route.ipp-routes-to-server-{block_suffix}.name
        namespace = var.namespace
      }}
    }}
  }}
'''

# Test with 4 customers and 3 blocks
num_customers = 8
number_of_blocks = 180
hcl_codes = generate_hcl_code(num_customers, number_of_blocks)
write_to_file("x_locals-regex.tf", hcl_codes)


# Generate and write resource blocks to a separate file
custom_route_block_suffixes = [i for i in range(number_of_blocks)]
write_custom_route_blocks("x_custom_route_blocks.tf", custom_route_block_suffixes)


# Generate and write lb route blocks to a separate file
lb_route_block_suffixes = [generate_lb_route_block(i) for i in range(number_of_blocks)]
write_lb_route_blocks("x_lb_route_blocks.tf", lb_route_block_suffixes)
