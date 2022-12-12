
resource "azurerm_virtual_network" "VNET_3-tier" {
  name          = var.resource_virtualnetwork
  address_space = var.resource_address-prefix
  location      = var.resource_group_location

  resource_group_name = var.resource_group_name

}

#Create FrontEnd Subnet 

resource "azurerm_subnet" "FrontEnd_3-tier-application" {
  name                 = var.resource_subnet1_frontend
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.resource_virtualnetwork
  address_prefixes     = var.frontend_subnet
  service_endpoints    = ["Microsoft.web"]
  delegation {
    name = "FrontEnd_3-tier-application-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }


  depends_on = [azurerm_virtual_network.VNET_3-tier]


}

#Create BackendEnd Subnet

resource "azurerm_subnet" "BackEnd_3-tier-application" {
  name                 = var.resource_subnet2_backend
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.resource_virtualnetwork
  address_prefixes     = var.backend_subnet
  service_endpoints    = ["Microsoft.Sql"]
  delegation {
    name = "BackendEnd_3-tier-application-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  depends_on = [azurerm_virtual_network.VNET_3-tier]


}



# create Database subnet
resource "azurerm_subnet" "Database_3_tier-application" {
  name                 = var.resource_subnet3_database
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.resource_virtualnetwork
  address_prefixes     = var.database_subnet
  service_endpoints    = ["Microsoft.Sql"]


  delegation {
    name = "Database_3_tier-application-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  depends_on = [azurerm_virtual_network.VNET_3-tier]
}

resource "azurerm_subnet" "privateendpoint" {
  name                 = var.resource_subnet4_endpoint
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.resource_virtualnetwork
  address_prefixes     = var.subnet_endpoint

  private_endpoint_network_policies_enabled = true

  depends_on = [
    azurerm_virtual_network.VNET_3-tier
  ]
}



