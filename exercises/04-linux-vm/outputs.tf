output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "vm_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/id_ed25519 ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}