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

variable "server_name" {
  type        = string
  description = "name of server"
  default     = "myservrer1"

}

variable "mysql_db_username" {
  type        = string
  description = "admin username"
  default     = "myserver9087"

}

variable "mysql_db_password" {
  type        = string
  description = "admin password"
  default     = "jinvjung@123A"

}

variable "server_sku_name" {
  type        = string
  description = "tier for server"
  default     = "GP_Gen5_2"
}


variable "mysql_firewall" {
  type        = string
  description = "allow access to azure services"
  default     = "firewall1"

}

variable "mysql_db_schema" {
  type        = string
  description = "name of database"
  default     = "database"

}

variable "mysql_client_ip" {
  type        = string
  description = "client ip"
  default     = "app-server-firewall-rule-Allow-Client-IP"
}






variable "resource_subnet4_endpoint" {
  type    = string
  default = "subnet4"

}
variable "subnet_endpoint" {
  type    = list(string)
  default = ["10.0.4.0/24"]

}

variable "resource_virtualnetwork" {
  type        = string
  description = "Name of virtual network"
  default     = "vnet-3-tier"
}


variable "resource_private_link" {
  type    = string
  default = "privatelink.mysql.database.azure.com"

}

variable "resource_private_endpoint" {
  type    = string
  default = "mysqlpvtendpoint"

}


variable "resource_dnszoneconfig" {
  type    = string
  default = "privatelink"
}

variable "subnet_id" {


}
variable "virtualnetwork_id" {

}








