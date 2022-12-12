terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.30.0"
    }
  }
  required_version = ">= 0.15.3"
  backend "azurerm" {
    resource_group_name  = "tfstateRG01"
    storage_account_name = "tfstate01332672081"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }


}


provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source = "./ResourceGroupTerraform"


}




module "webapp2" {
  source                  = "./AppServices"
  resource_group_name     = module.ResourceGroup.rg_name_output
  resource_group_location = module.ResourceGroup.rg_location_output
  subnet_frontend_id      = module.virtualnetwork.frontend_subnet_id_output
  subnet_backend_id       = module.virtualnetwork.backend_subnet_id_output




  depends_on = [
    module.ResourceGroup
  ]





}

module "database1" {
  source                  = "./Database"
  resource_group_name     = module.ResourceGroup.rg_name_output
  resource_group_location = module.ResourceGroup.rg_location_output
  subnet_id               = module.virtualnetwork.subnet_id_output
  virtualnetwork_id       = module.virtualnetwork.virtualnetwork_id_output
  depends_on = [
    module.virtualnetwork
  ]




}
module "virtualnetwork" {
  source                  = "./VirtualNetwork"
  resource_group_name     = module.ResourceGroup.rg_name_output
  resource_group_location = module.ResourceGroup.rg_location_output


  depends_on = [
    module.ResourceGroup
  ]





}

module "StorageAccount" {
  source                  = "./Storage Account"
  resource_group_name     = module.ResourceGroup.rg_name_output
  resource_group_location = module.ResourceGroup.rg_location_output
  depends_on = [
    module.webapp2
  ]


}

module "DiagnosticSettings" {
  source                      = "./DiagnosticSettings"
  resource_group_name         = module.ResourceGroup.rg_name_output
  resource_group_location     = module.ResourceGroup.rg_location_output
  target_resource_id_frontend = module.webapp2.frontend_id
  target_resource_id_backend  = module.webapp2.backend_id
  storage_account_id          = module.StorageAccount.storage_account_id_ouput

  depends_on = [
    module.webapp2
  ]

}

module "FrontDoor" {
  source                  = "./FrontDoor"
  resource_group_name     = module.ResourceGroup.rg_name_output
  resource_group_location = module.ResourceGroup.rg_location_output
  depends_on = [
    module.DiagnosticSettings
  ]

}
