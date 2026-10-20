variable "subscription_id" {
  description = "Azure subscription ID"
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
// storage_suffix variable is used to create a unique name for the storage account
variable "storage_suffix" {
  description = "Unique suffix for storage account"
  type        = string
}