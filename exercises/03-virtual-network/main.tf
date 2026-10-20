resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}

/*
virtual network resource in private network
with 10.0.0.0/16 we have 65536 IP addresses available for our virtual network
*/
resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.common_tags
}

/*
subnet resource in the virtual network
with 10.0.0/16 we have 256 IP addresses available for our subnet
where we have 251 usable IP addresses for azure
*/
resource "azurerm_subnet" "app" {
  name                 = local.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = var.subnet_address_prefixes
}

resource "azurerm_network_security_group" "app" {
  name                = local.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.common_tags
}

resource "azurerm_network_security_rule" "allow_https" {
  name                       = "Allow-HTTPS-From-VNet"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "443"
  source_address_prefix      = "VirtualNetwork"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.app.name
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}