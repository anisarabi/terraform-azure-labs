// provider allow to communicate with the Azure Resource Manager APIs
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

