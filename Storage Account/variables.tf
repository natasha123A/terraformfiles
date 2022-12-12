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

variable "storage_account_container" {
  type        = string
  description = "name of blob container"
  default     = "blob"

}
