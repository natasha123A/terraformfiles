




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
variable "resource_subnet2_backend" {
  type        = string
  description = "name of subnet2"
  default     = "subnet2"
}
variable "backend_subnet" {
  type        = list(string)
  description = "subnet for backend application"
  default     = ["10.0.2.0/24"]


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

variable "frontend_subnet" {
  type        = list(string)
  description = "subnet for frontend application"
  default     = ["10.0.1.0/24"]

}
variable "resource_virtualnetwork" {
  type        = string
  description = "Name of virtual network"
  default     = "vnet-3-tier"
}
variable "resource_subnet1_frontend" {
  type        = string
  description = "name of subnet1"
  default     = "subnet1"

}

variable "subnet_frontend_id" {
  type = string


}
variable "subnet_backend_id" {

}



