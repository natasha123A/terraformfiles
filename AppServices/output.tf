output "webapp2_output" {
  value = azurerm_linux_web_app.webapp8.name

}
output "webapp_output" {
  value = azurerm_windows_web_app.webapp9.name
}

output "backend_subnet_output" {
  value = var.subnet_backend_id

}
output "frontend_subnet_output" {
  value = var.subnet_frontend_id

}

output "frontend_id" {
  value = azurerm_windows_web_app.webapp9.id

}
output "backend_id" {
  # value = azurerm_linux_web_app.webapp8.id
  value = azurerm_linux_web_app.webapp8.id

}

