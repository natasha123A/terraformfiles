




resource "azurerm_mysql_server" "mysql_server" {
  name                = var.server_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  administrator_login          = var.mysql_db_username
  administrator_login_password = var.mysql_db_password


  sku_name   = var.server_sku_name
  storage_mb = 5120
  version    = "8.0"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"


}





resource "azurerm_mysql_database" "webapp" {
  name                = var.mysql_db_schema
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  depends_on = [
    azurerm_mysql_server.mysql_server
  ]
}

resource "azurerm_private_dns_zone" "privatednszone" {
  name                = var.resource_private_link
  resource_group_name = var.resource_group_name
  depends_on = [
    azurerm_mysql_server.mysql_server
  ]

}


resource "azurerm_private_endpoint" "Privateendpoint" {
  name                = var.resource_private_endpoint
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatednszone.id]
  }

  private_service_connection {
    name                           = "mysqlprivateconnection"
    private_connection_resource_id = azurerm_mysql_server.mysql_server.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
  depends_on = [
    azurerm_mysql_server.mysql_server
  ]
}



resource "azurerm_private_dns_zone_virtual_network_link" "dnszoneconfig" {
  name                  = var.resource_dnszoneconfig
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.privatednszone.name
  virtual_network_id    = var.virtualnetwork_id
  depends_on = [
    azurerm_mysql_server.mysql_server
  ]


}





