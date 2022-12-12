output "Rg_Final_output" {
  value = module.ResourceGroup.rg_name_output

}



output "webapp2_final_output" {
  value = module.webapp2.webapp2_output

}

output "webapp_final_output" {
  value = module.webapp2.webapp_output

}


output "server_final_output" {
  value = module.database1.mysql_server_output

}

output "virtual_network_final_output" {
  value = module.virtualnetwork.virtual_network_output
}

output "front_subnet_final_output" {
  value = module.virtualnetwork.frontend_subnet_output

}
output "backend_subnet_final_output" {
  value = module.virtualnetwork.backend_subnet_output

}
output "database_subnet_final_output" {
  value = module.virtualnetwork.database_subnet_output



}

output "storage_account_final_output" {
  value = module.StorageAccount.storage_account_output

}
output "diagnostic_setting_final_output" {
  value = module.DiagnosticSettings.diagnostic_settings_ouput

}

output "frontdoor_final_output" {
  value = module.FrontDoor.frontdoor_output

}
