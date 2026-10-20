locals {
  resource_group_name = "rg-${var.project}-${var.environment}"

  vnet_name = "vnet-${var.project}-${var.environment}"

  subnet_name = "snet-app-${var.environment}"

  nsg_name = "nsg-app-${var.environment}"

  common_tags = {
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "Terraform"
  }
}