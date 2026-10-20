
locals {
  prefix = "tflab05-${var.environment}"
}

# 1. Virtual Network
resource "azurerm_virtual_network" "this" {
  name                = "vnet-${local.prefix}"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

# 2. Subnet
resource "azurerm_subnet" "this" {
  name                 = "snet-${local.prefix}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.subnet_address_prefixes
}

# 3. Network Security Group
resource "azurerm_network_security_group" "this" {
  name                = "nsg-${local.prefix}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

# 4. SSH security rule
resource "azurerm_network_security_rule" "ssh" {
  name                       = "Allow-SSH"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = var.allowed_ssh_cidr
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}

# 5. Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}
