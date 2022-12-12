output "virtual_network_output" {
  value = azurerm_virtual_network.VNET_3-tier.name

}

output "frontend_subnet_output" {
  value = azurerm_subnet.FrontEnd_3-tier-application.name

}

output "backend_subnet_output" {
  value = azurerm_subnet.BackEnd_3-tier-application.name

}
output "database_subnet_output" {
  value = azurerm_subnet.Database_3_tier-application.name

}

output "backend_subnet_id_output" {
  value = azurerm_subnet.BackEnd_3-tier-application.id

}
output "frontend_subnet_id_output" {
  value = azurerm_subnet.FrontEnd_3-tier-application.id

}

output "subnet_id_output" {
  value = azurerm_subnet.privateendpoint.id

}

output "virtualnetwork_id_output" {
  value = azurerm_virtual_network.VNET_3-tier.id

}

