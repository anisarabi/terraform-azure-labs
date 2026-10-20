
# 1. Event Hubs Namespace
resource "azurerm_eventhub_namespace" "this" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku      = var.sku
  capacity = var.capacity

  tags = var.tags
}

# 2. Event Hub
resource "azurerm_eventhub" "this" {
  name         = var.eventhub_name
  namespace_id = azurerm_eventhub_namespace.this.id

  partition_count   = var.partition_count
  message_retention = var.message_retention
}

# 3. Consumer Group
resource "azurerm_eventhub_consumer_group" "this" {
  name                = var.consumer_group_name
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = azurerm_eventhub.this.name
  resource_group_name = var.resource_group_name
}
