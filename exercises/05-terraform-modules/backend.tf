//command to launch terraform init -migrate-state
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-dev"
    storage_account_name = "sttfstateg3rd29xg"
    container_name       = "tfstate"
    key                  = "exercise05-dev.tfstate"

    use_azuread_auth = true
  }
}