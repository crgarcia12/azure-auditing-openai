terraform {
  # backend "azurerm" {
  #   resource_group_name  = "rg-dev-contoso-terraform"
  #   storage_account_name = "devcontosoterraform"
  #   container_name       = "tfstate"
  #   key                  = "openai.tfstate"
  # }
}

provider "azurerm" {
  features {}
}