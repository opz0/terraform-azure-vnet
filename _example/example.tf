provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "git::https://github.com/opz0/terraform-azure-resource-group.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  location    = "North Europe"
}


module "vnet" {
  source              = "./../"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
}
