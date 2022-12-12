


resource "azurerm_service_plan" "appserviceplann" {

  name = var.app_service_plan2

  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"

  sku_name = "S1"


}

resource "azurerm_linux_web_app" "webapp8" {

  name = var.resource_web_app_node
  //name                = var.resource_web_app_node
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appserviceplann.id
  https_only          = false
  app_settings = {
    "WEBSITE_DNS_SERVER" : "168.63.129.16",
    "WEBSITE_VNET_ROUTE_ALL" : "1"
  }

  site_config {
    application_stack {
      node_version = "14-lts"
    }



  }

  depends_on = [azurerm_service_plan.appserviceplann]




}

resource "azurerm_app_service_source_control" "sourcecontrol1" {
  app_id   = azurerm_linux_web_app.webapp8.id
  repo_url = "https://github.com/natasha123A/terraformbackend"
  branch   = "master"

}



resource "azurerm_app_service_virtual_network_swift_connection" "example" {



  app_service_id = azurerm_linux_web_app.webapp8.id
  subnet_id      = var.subnet_backend_id
}





resource "azurerm_service_plan" "appserviceplannn" {
  name                = var.app_service_plan
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "S1"
}


resource "azurerm_windows_web_app" "webapp9" {
  name                = var.resource_web_app
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.appserviceplannn.id
  https_only          = false

  site_config {
    minimum_tls_version = "1.2"




  }
  depends_on = [azurerm_service_plan.appserviceplannn]
}

resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id   = azurerm_windows_web_app.webapp9.id
  repo_url = "https://github.com/natasha123A/frontendterra"
  branch   = "master"

}
resource "azurerm_app_service_virtual_network_swift_connection" "example2" {
  app_service_id = azurerm_windows_web_app.webapp9.id
  subnet_id      = var.subnet_frontend_id
}






