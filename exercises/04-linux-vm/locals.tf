locals {
  prefix = "${var.project}-${var.environment}"

  rg_name     = "rg-${local.prefix}-vm"
  vnet_name   = "vnet-${local.prefix}"
  subnet_name = "snet-${local.prefix}"
  nsg_name    = "nsg-${local.prefix}"
  pip_name    = "pip-${local.prefix}"
  nic_name    = "nic-${local.prefix}"
  vm_name     = "vm-${local.prefix}"

  common_tags = {
    Environment = var.environment
    Project     = var.project
    ManagedBy   = "Terraform"
  }
}