
resource "azurerm_role_assignment" "sender" {
  scope                = azurerm_eventhub.this.id
  role_definition_name = "Azure Event Hubs Data Sender"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "receiver" {
  scope                = azurerm_eventhub.this.id
  role_definition_name = "Azure Event Hubs Data Receiver"
  principal_id         = var.principal_id
}
