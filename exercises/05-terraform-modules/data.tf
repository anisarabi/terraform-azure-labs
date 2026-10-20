// allow Terraform to access the current Azure subscription and tenant information
// to avoid to launch USER_OBJECT_ID=$(az ad signed-in-user show --query id -o tsv)
data "azurerm_client_config" "current" {}
