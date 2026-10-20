locals {
  prefix = "tflab05-${var.environment}"

  common_tags = {
    Project     = "Terraform-Labs"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "resource_group" {
  source = "./modules/resource-group"

  name     = "rg-${local.prefix}"
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  environment = var.environment

  vnet_address_space      = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  allowed_ssh_cidr        = var.allowed_ssh_cidr

  tags = local.common_tags
}


module "virtual_machine" {
  source = "./modules/virtual-machine"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  environment = var.environment

  subnet_id = module.network.subnet_id

  vm_size        = var.vm_size
  admin_username = var.admin_username

  ssh_public_key = file(
    pathexpand(var.ssh_public_key_path)
  )

  tags = local.common_tags
}


module "eventhub" {
  source = "./modules/eventhub"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  namespace_name      = var.eventhub_namespace_name
  eventhub_name       = var.eventhub_name
  consumer_group_name = "monitoring"

  sku               = "Standard"
  capacity          = var.eventhub_capacity
  partition_count   = var.eventhub_partition_count
  message_retention = 1

  tags         = local.common_tags
  principal_id = data.azurerm_client_config.current.object_id
}

