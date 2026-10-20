
variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "namespace_name" {
  description = "Globally unique Event Hubs namespace name"
  type        = string
}

variable "eventhub_name" {
  description = "Event Hub name"
  type        = string
  default     = "application-logs"
}

variable "consumer_group_name" {
  description = "Consumer Group name"
  type        = string
  default     = "monitoring"
}

variable "sku" {
  description = "Event Hubs Namespace SKU"
  type        = string
  default     = "Standard"
}

variable "capacity" {
  description = "Number of throughput units"
  type        = number
  default     = 1
}

variable "partition_count" {
  description = "Number of Event Hub partitions"
  type        = number
  default     = 2
}

variable "message_retention" {
  description = "Event retention in days"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Azure resource tags"
  type        = map(string)
  default     = {}
}

variable "principal_id" {
  description = "Microsoft Entra ID object ID of the user"
  type        = string
}
