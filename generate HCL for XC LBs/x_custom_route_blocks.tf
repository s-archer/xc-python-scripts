
resource "volterra_route" "ipp-routes-to-server-0" {
  name      = "ipp-routes-to-server-0"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-0
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-1" {
  name      = "ipp-routes-to-server-1"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-1
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-2" {
  name      = "ipp-routes-to-server-2"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-2
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-3" {
  name      = "ipp-routes-to-server-3"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-3
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-4" {
  name      = "ipp-routes-to-server-4"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-4
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-5" {
  name      = "ipp-routes-to-server-5"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-5
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-6" {
  name      = "ipp-routes-to-server-6"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-6
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-7" {
  name      = "ipp-routes-to-server-7"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-7
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-8" {
  name      = "ipp-routes-to-server-8"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-8
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-9" {
  name      = "ipp-routes-to-server-9"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-9
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-10" {
  name      = "ipp-routes-to-server-10"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-10
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-11" {
  name      = "ipp-routes-to-server-11"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-11
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-12" {
  name      = "ipp-routes-to-server-12"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-12
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-13" {
  name      = "ipp-routes-to-server-13"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-13
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-14" {
  name      = "ipp-routes-to-server-14"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-14
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-15" {
  name      = "ipp-routes-to-server-15"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-15
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-16" {
  name      = "ipp-routes-to-server-16"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-16
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-17" {
  name      = "ipp-routes-to-server-17"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-17
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-18" {
  name      = "ipp-routes-to-server-18"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-18
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-19" {
  name      = "ipp-routes-to-server-19"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-19
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-20" {
  name      = "ipp-routes-to-server-20"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-20
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-21" {
  name      = "ipp-routes-to-server-21"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-21
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-22" {
  name      = "ipp-routes-to-server-22"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-22
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-23" {
  name      = "ipp-routes-to-server-23"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-23
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-24" {
  name      = "ipp-routes-to-server-24"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-24
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-25" {
  name      = "ipp-routes-to-server-25"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-25
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-26" {
  name      = "ipp-routes-to-server-26"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-26
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-27" {
  name      = "ipp-routes-to-server-27"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-27
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-28" {
  name      = "ipp-routes-to-server-28"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-28
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-29" {
  name      = "ipp-routes-to-server-29"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-29
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-30" {
  name      = "ipp-routes-to-server-30"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-30
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-31" {
  name      = "ipp-routes-to-server-31"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-31
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-32" {
  name      = "ipp-routes-to-server-32"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-32
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-33" {
  name      = "ipp-routes-to-server-33"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-33
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-34" {
  name      = "ipp-routes-to-server-34"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-34
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-35" {
  name      = "ipp-routes-to-server-35"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-35
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-36" {
  name      = "ipp-routes-to-server-36"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-36
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-37" {
  name      = "ipp-routes-to-server-37"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-37
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-38" {
  name      = "ipp-routes-to-server-38"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-38
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-39" {
  name      = "ipp-routes-to-server-39"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-39
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-40" {
  name      = "ipp-routes-to-server-40"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-40
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-41" {
  name      = "ipp-routes-to-server-41"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-41
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-42" {
  name      = "ipp-routes-to-server-42"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-42
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-43" {
  name      = "ipp-routes-to-server-43"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-43
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-44" {
  name      = "ipp-routes-to-server-44"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-44
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-45" {
  name      = "ipp-routes-to-server-45"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-45
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-46" {
  name      = "ipp-routes-to-server-46"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-46
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-47" {
  name      = "ipp-routes-to-server-47"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-47
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-48" {
  name      = "ipp-routes-to-server-48"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-48
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-49" {
  name      = "ipp-routes-to-server-49"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-49
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-50" {
  name      = "ipp-routes-to-server-50"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-50
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-51" {
  name      = "ipp-routes-to-server-51"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-51
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-52" {
  name      = "ipp-routes-to-server-52"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-52
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-53" {
  name      = "ipp-routes-to-server-53"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-53
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-54" {
  name      = "ipp-routes-to-server-54"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-54
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-55" {
  name      = "ipp-routes-to-server-55"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-55
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-56" {
  name      = "ipp-routes-to-server-56"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-56
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-57" {
  name      = "ipp-routes-to-server-57"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-57
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-58" {
  name      = "ipp-routes-to-server-58"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-58
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-59" {
  name      = "ipp-routes-to-server-59"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-59
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-60" {
  name      = "ipp-routes-to-server-60"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-60
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-61" {
  name      = "ipp-routes-to-server-61"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-61
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-62" {
  name      = "ipp-routes-to-server-62"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-62
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-63" {
  name      = "ipp-routes-to-server-63"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-63
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-64" {
  name      = "ipp-routes-to-server-64"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-64
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-65" {
  name      = "ipp-routes-to-server-65"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-65
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-66" {
  name      = "ipp-routes-to-server-66"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-66
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-67" {
  name      = "ipp-routes-to-server-67"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-67
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-68" {
  name      = "ipp-routes-to-server-68"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-68
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-69" {
  name      = "ipp-routes-to-server-69"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-69
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-70" {
  name      = "ipp-routes-to-server-70"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-70
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-71" {
  name      = "ipp-routes-to-server-71"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-71
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-72" {
  name      = "ipp-routes-to-server-72"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-72
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-73" {
  name      = "ipp-routes-to-server-73"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-73
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-74" {
  name      = "ipp-routes-to-server-74"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-74
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-75" {
  name      = "ipp-routes-to-server-75"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-75
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-76" {
  name      = "ipp-routes-to-server-76"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-76
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-77" {
  name      = "ipp-routes-to-server-77"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-77
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-78" {
  name      = "ipp-routes-to-server-78"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-78
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-79" {
  name      = "ipp-routes-to-server-79"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-79
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-80" {
  name      = "ipp-routes-to-server-80"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-80
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-81" {
  name      = "ipp-routes-to-server-81"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-81
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-82" {
  name      = "ipp-routes-to-server-82"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-82
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-83" {
  name      = "ipp-routes-to-server-83"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-83
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-84" {
  name      = "ipp-routes-to-server-84"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-84
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-85" {
  name      = "ipp-routes-to-server-85"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-85
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-86" {
  name      = "ipp-routes-to-server-86"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-86
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-87" {
  name      = "ipp-routes-to-server-87"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-87
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-88" {
  name      = "ipp-routes-to-server-88"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-88
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-89" {
  name      = "ipp-routes-to-server-89"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-89
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-90" {
  name      = "ipp-routes-to-server-90"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-90
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-91" {
  name      = "ipp-routes-to-server-91"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-91
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-92" {
  name      = "ipp-routes-to-server-92"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-92
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-93" {
  name      = "ipp-routes-to-server-93"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-93
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-94" {
  name      = "ipp-routes-to-server-94"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-94
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-95" {
  name      = "ipp-routes-to-server-95"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-95
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-96" {
  name      = "ipp-routes-to-server-96"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-96
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-97" {
  name      = "ipp-routes-to-server-97"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-97
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-98" {
  name      = "ipp-routes-to-server-98"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-98
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-99" {
  name      = "ipp-routes-to-server-99"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-99
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-100" {
  name      = "ipp-routes-to-server-100"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-100
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-101" {
  name      = "ipp-routes-to-server-101"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-101
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-102" {
  name      = "ipp-routes-to-server-102"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-102
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-103" {
  name      = "ipp-routes-to-server-103"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-103
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-104" {
  name      = "ipp-routes-to-server-104"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-104
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-105" {
  name      = "ipp-routes-to-server-105"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-105
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-106" {
  name      = "ipp-routes-to-server-106"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-106
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-107" {
  name      = "ipp-routes-to-server-107"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-107
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-108" {
  name      = "ipp-routes-to-server-108"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-108
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-109" {
  name      = "ipp-routes-to-server-109"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-109
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-110" {
  name      = "ipp-routes-to-server-110"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-110
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-111" {
  name      = "ipp-routes-to-server-111"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-111
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-112" {
  name      = "ipp-routes-to-server-112"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-112
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-113" {
  name      = "ipp-routes-to-server-113"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-113
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-114" {
  name      = "ipp-routes-to-server-114"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-114
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-115" {
  name      = "ipp-routes-to-server-115"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-115
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-116" {
  name      = "ipp-routes-to-server-116"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-116
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-117" {
  name      = "ipp-routes-to-server-117"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-117
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-118" {
  name      = "ipp-routes-to-server-118"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-118
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-119" {
  name      = "ipp-routes-to-server-119"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-119
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-120" {
  name      = "ipp-routes-to-server-120"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-120
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-121" {
  name      = "ipp-routes-to-server-121"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-121
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-122" {
  name      = "ipp-routes-to-server-122"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-122
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-123" {
  name      = "ipp-routes-to-server-123"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-123
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-124" {
  name      = "ipp-routes-to-server-124"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-124
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-125" {
  name      = "ipp-routes-to-server-125"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-125
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-126" {
  name      = "ipp-routes-to-server-126"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-126
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-127" {
  name      = "ipp-routes-to-server-127"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-127
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-128" {
  name      = "ipp-routes-to-server-128"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-128
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-129" {
  name      = "ipp-routes-to-server-129"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-129
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-130" {
  name      = "ipp-routes-to-server-130"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-130
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-131" {
  name      = "ipp-routes-to-server-131"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-131
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-132" {
  name      = "ipp-routes-to-server-132"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-132
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-133" {
  name      = "ipp-routes-to-server-133"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-133
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-134" {
  name      = "ipp-routes-to-server-134"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-134
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-135" {
  name      = "ipp-routes-to-server-135"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-135
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-136" {
  name      = "ipp-routes-to-server-136"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-136
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-137" {
  name      = "ipp-routes-to-server-137"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-137
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-138" {
  name      = "ipp-routes-to-server-138"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-138
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-139" {
  name      = "ipp-routes-to-server-139"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-139
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-140" {
  name      = "ipp-routes-to-server-140"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-140
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-141" {
  name      = "ipp-routes-to-server-141"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-141
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-142" {
  name      = "ipp-routes-to-server-142"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-142
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-143" {
  name      = "ipp-routes-to-server-143"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-143
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-144" {
  name      = "ipp-routes-to-server-144"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-144
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-145" {
  name      = "ipp-routes-to-server-145"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-145
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-146" {
  name      = "ipp-routes-to-server-146"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-146
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-147" {
  name      = "ipp-routes-to-server-147"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-147
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-148" {
  name      = "ipp-routes-to-server-148"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-148
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-149" {
  name      = "ipp-routes-to-server-149"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-149
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-150" {
  name      = "ipp-routes-to-server-150"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-150
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-151" {
  name      = "ipp-routes-to-server-151"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-151
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-152" {
  name      = "ipp-routes-to-server-152"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-152
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-153" {
  name      = "ipp-routes-to-server-153"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-153
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-154" {
  name      = "ipp-routes-to-server-154"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-154
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-155" {
  name      = "ipp-routes-to-server-155"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-155
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-156" {
  name      = "ipp-routes-to-server-156"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-156
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-157" {
  name      = "ipp-routes-to-server-157"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-157
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-158" {
  name      = "ipp-routes-to-server-158"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-158
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-159" {
  name      = "ipp-routes-to-server-159"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-159
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-160" {
  name      = "ipp-routes-to-server-160"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-160
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-161" {
  name      = "ipp-routes-to-server-161"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-161
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-162" {
  name      = "ipp-routes-to-server-162"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-162
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-163" {
  name      = "ipp-routes-to-server-163"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-163
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-164" {
  name      = "ipp-routes-to-server-164"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-164
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-165" {
  name      = "ipp-routes-to-server-165"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-165
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-166" {
  name      = "ipp-routes-to-server-166"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-166
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-167" {
  name      = "ipp-routes-to-server-167"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-167
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-168" {
  name      = "ipp-routes-to-server-168"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-168
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-169" {
  name      = "ipp-routes-to-server-169"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-169
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-170" {
  name      = "ipp-routes-to-server-170"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-170
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-171" {
  name      = "ipp-routes-to-server-171"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-171
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-172" {
  name      = "ipp-routes-to-server-172"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-172
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-173" {
  name      = "ipp-routes-to-server-173"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-173
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-174" {
  name      = "ipp-routes-to-server-174"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-174
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-175" {
  name      = "ipp-routes-to-server-175"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-175
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-176" {
  name      = "ipp-routes-to-server-176"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-176
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-177" {
  name      = "ipp-routes-to-server-177"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-177
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-178" {
  name      = "ipp-routes-to-server-178"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-178
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}



resource "volterra_route" "ipp-routes-to-server-179" {
  name      = "ipp-routes-to-server-179"
  namespace = var.namespace

  dynamic "routes" {
    for_each = local.routes-179
    content {
      match {
        http_method = "ANY"
        path {
          prefix = "/"
        }
        headers {
          name = "Host"
          regex = routes.value.regex
        }
      }
      route_destination {
        auto_host_rewrite = true
        timeout           = 3600
        destinations {
          cluster {
            name      = format("ves-io-origin-pool-%s", volterra_origin_pool.origin.name)
            namespace = var.namespace
          }
          weight = 1
        }
      }
    }
  }
}


