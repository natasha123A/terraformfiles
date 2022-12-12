output "mysql_server_output" {
  value = azurerm_mysql_server.mysql_server.name

}

output "subnet_id_output" {
  value = var.subnet_id

}
output "virtualnetwork_id_output" {
  value = var.virtualnetwork_id

}
