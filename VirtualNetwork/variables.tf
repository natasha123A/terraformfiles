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

variable "resource_virtualnetwork" {
  type        = string
  description = "Name of virtual network"
  default     = "vnet-3-tier"
}

variable "resource_address-prefix" {
  type        = list(string)
  description = "address space "
  default     = ["10.0.0.0/16"]

}
variable "resource_subnet1_frontend" {
  type        = string
  description = "name of subnet1"
  default     = "subnet1"

}

variable "frontend_subnet" {
  type        = list(string)
  description = "subnet for frontend application"
  default     = ["10.0.1.0/24"]

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
variable "resource_subnet3_database" {
  type        = string
  description = "name of subnet3"
  default     = "subnet3"


}
variable "database_subnet" {
  type        = list(string)
  description = "subnet for database application"
  default     = ["10.0.3.0/24"]

}

variable "resource_subnet4_endpoint" {
  type    = string
  default = "subnet4"

}

variable "subnet_endpoint" {
  type    = list(string)
  default = ["10.0.4.0/24"]

}






