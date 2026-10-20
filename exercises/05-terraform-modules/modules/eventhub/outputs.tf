
output "namespace_id" {
  description = "Event Hubs Namespace ID"
  value       = azurerm_eventhub_namespace.this.id
}

output "namespace_name" {
  description = "Event Hubs Namespace name"
  value       = azurerm_eventhub_namespace.this.name
}

output "eventhub_id" {
  description = "Event Hub ID"
  value       = azurerm_eventhub.this.id
}

output "eventhub_name" {
  description = "Event Hub name"
  value       = azurerm_eventhub.this.name
}

output "consumer_group_name" {
  description = "Consumer Group name"
  value       = azurerm_eventhub_consumer_group.this.name
}

output "sender_role_assignment_id" {
  description = "Sender role assignment ID"
  value       = azurerm_role_assignment.sender.id
}

output "receiver_role_assignment_id" {
  description = "Receiver role assignment ID"
  value       = azurerm_role_assignment.receiver.id
}
