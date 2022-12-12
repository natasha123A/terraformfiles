variable "resource_diagnosticsetting_frontendapp" {
  type    = string
  default = "appservicefrontend"

}


variable "resource_group_name" {
  type        = string
  description = "resoure group made through terraform"
  default     = "terraformRG"
}
variable "resource_group_location" {
  type        = string
  description = "location of resource group"
  default     = "koreacentral"

}

variable "resoure_storage_account" {
  type        = string
  description = "Name of storage account"
  default     = "storage3130"
}
variable "app_service_plan" {
  type        = string
  description = "name of an app service plan"
  default     = "appservicefrontend1"

}




variable "resource_web_app" {
  type        = string
  description = "name of frontend web app"
  default     = "frontendang899"
}

variable "resource_diagnosticsetting_backendapp" {
  type    = string
  default = "appservicebackend"

}

variable "app_service_plan2" {
  type        = string
  description = "name of an app service plan"
  default     = "appservicebackend"

}




variable "resource_web_app_node" {
  type        = string
  description = "name of frontend web app"
  default     = "backendnode7800"
}



variable "target_resource_id_frontend" {

}

variable "target_resource_id_backend" {

}

variable "storage_account_id" {

}

