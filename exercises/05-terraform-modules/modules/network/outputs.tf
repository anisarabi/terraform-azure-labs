
output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = azurerm_virtual_network.this.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.this.id
}

output "subnet_name" {
  description = "Subnet name"
  value       = azurerm_subnet.this.name
}

output "nsg_id" {
  description = "Network Security Group ID"
  value       = azurerm_network_security_group.this.id
}

output "nsg_association_id" {
  description = "Subnet/NSG association ID"
  value       = azurerm_subnet_network_security_group_association.this.id
}