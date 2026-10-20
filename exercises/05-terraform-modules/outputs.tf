output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_id" {
  value = module.resource_group.id
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "nsg_id" {
  value = module.network.nsg_id
}


output "vm_name" {
  value = module.virtual_machine.vm_name
}

output "vm_public_ip" {
  value = module.virtual_machine.public_ip
}

output "vm_private_ip" {
  value = module.virtual_machine.private_ip
}

output "vm_admin_username" {
  value = module.virtual_machine.admin_username
}

output "eventhub_namespace_name" {
  value = module.eventhub.namespace_name
}

output "eventhub_name" {
  value = module.eventhub.eventhub_name
}

output "eventhub_id" {
  value = module.eventhub.eventhub_id
}

output "eventhub_consumer_group" {
  value = module.eventhub.consumer_group_name
}

output "eventhub_sender_role_id" {
  value = module.eventhub.sender_role_assignment_id
}

output "eventhub_receiver_role_id" {
  value = module.eventhub.receiver_role_assignment_id
}