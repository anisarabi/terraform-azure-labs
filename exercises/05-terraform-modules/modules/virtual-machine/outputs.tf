
output "vm_id" {
  description = "Virtual Machine ID"
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "Virtual Machine name"
  value       = azurerm_linux_virtual_machine.this.name
}

output "public_ip" {
  description = "Public IPv4 address"
  value       = azurerm_public_ip.this.ip_address
}

output "private_ip" {
  description = "Private IPv4 address"
  value       = azurerm_network_interface.this.private_ip_address
}

output "admin_username" {
  description = "Linux admin username"
  value       = var.admin_username
}
