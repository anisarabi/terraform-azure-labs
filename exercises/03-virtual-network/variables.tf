variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "tflab"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "francecentral"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string) // List of address spaces for the virtual network
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Subnet address prefixes"
  type        = list(string) // List of address prefixes for the subnets
  default     = ["10.0.1.0/24"]
}