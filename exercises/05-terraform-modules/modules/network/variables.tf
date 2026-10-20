
variable "resource_group_name" {
  description = "Name of the existing Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string)
}

variable "allowed_ssh_cidr" {
  description = "Authorized public IP for SSH"
  type        = string
}

variable "tags" {
  description = "Azure resource tags"
  type        = map(string)
  default     = {}
}
