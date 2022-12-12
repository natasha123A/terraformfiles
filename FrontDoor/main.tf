resource "azurerm_frontdoor" "applicationfrontdoor" {
  name                = "frontdoor-3-tier"
  resource_group_name = var.resource_group_name



  routing_rule {
    name               = "routingrule"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["frontdoor-3-tier"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "application-backend-pool-dev"
    }
  }

  backend_pool_load_balancing {
    name = "loadbalancingsettings"
  }

  backend_pool_health_probe {
    name = "healthprobesettings"

  }
  backend_pool {
    name = "application-backend-pool-dev"
    backend {
      host_header = "frontendang891.azurewebsites.net"
      address     = "frontendang891.azurewebsites.net"
      http_port   = 80
      https_port  = 443
    }
    load_balancing_name = "loadbalancingsettings"
    health_probe_name   = "healthprobesettings"
  }

  frontend_endpoint {
    name                         = "frontdoor-3-tier"
    host_name                    = "frontdoor-3-tier.azurefd.net"
    session_affinity_enabled     = false
    session_affinity_ttl_seconds = 0
  }
}
