output "diagnostic_settings_ouput" {
  value = azurerm_monitor_diagnostic_setting.diagnos.name

}


output "target_frontendid_output" {
  value = var.target_resource_id_frontend

}
output "target_backendid_output" {
  value = var.target_resource_id_backend

}

output "storage_account_id_ouput" {
  value = var.storage_account_id

}
