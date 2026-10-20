locals {
  resource_group_name = "rg-${var.project}-${var.environment}"

  storage_account_name = "st${var.project}${var.environment}${var.storage_suffix}"

  common_tags = {
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "Terraform"
  }
}