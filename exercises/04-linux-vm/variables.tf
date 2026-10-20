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
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "francecentral"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Linux administrator username"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "allowed_ssh_cidr" { //
  description = "Public IP CIDR authorized for SSH"
  type        = string
}