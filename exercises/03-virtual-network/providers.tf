provider "azurerm" {
  features {} // required for provider version 2.0 and above

  subscription_id = var.subscription_id
}