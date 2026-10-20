output "resource_group_name" {
  description = "Resource Group name"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.storage.name
}

output "storage_account_id" {
  description = "Storage Account Azure ID"
  value       = azurerm_storage_account.storage.id
}

output "blob_container_name" {
  description = "Blob container name"
  value       = azurerm_storage_container.container.name
}