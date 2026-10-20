variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure deployment region"
  type        = string
  default     = "swedencentral"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "allowed_ssh_cidr" {
  description = "Authorized public IPv4 CIDR for SSH"
  type        = string

  validation {
    condition = (
      can(cidrhost(var.allowed_ssh_cidr, 0)) &&
      var.allowed_ssh_cidr != "0.0.0.0/0"
    )
    error_message = "Use a restricted CIDR, such as your public IPv4/32."
  }
}


variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "admin_username" {
  description = "Linux administrator username"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}


variable "eventhub_namespace_name" {
  description = "Globally unique Event Hubs namespace name"
  type        = string
}

variable "eventhub_name" {
  description = "Event Hub name"
  type        = string
  default     = "application-logs"
}

variable "eventhub_partition_count" {
  description = "Number of Event Hub partitions"
  type        = number
  default     = 2
}

variable "eventhub_capacity" {
  description = "Namespace throughput units"
  type        = number
  default     = 1
}

