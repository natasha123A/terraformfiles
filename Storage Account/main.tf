resource "azurerm_storage_account" "storageaccountdiagnostic" {
  name                     = var.resoure_storage_account
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_storage_container" "Blob" {
  name                  = var.storage_account_container
  storage_account_name  = var.resoure_storage_account
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.storageaccountdiagnostic
  ]
}



