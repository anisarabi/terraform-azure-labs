# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS" // LRS = Locally Redundant Storage, GRS = Geo-Redundant Storage, ZRS = Zone-Redundant Storage
  account_kind             = "StorageV2"

  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false

  tags = local.common_tags
}

# Blob Container
resource "azurerm_storage_container" "container" {
  name                  = "data"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}