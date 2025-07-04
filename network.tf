resource "azurerm_virtual_network" "this" {
  name                = "vnet-complience-01"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = [local.vnet_address_space]
}

resource "azurerm_subnet" "first" {
  name                            = "snet-first"
  resource_group_name             = azurerm_resource_group.this.name
  virtual_network_name            = azurerm_virtual_network.this.name
  address_prefixes                = [cidrsubnet(local.vnet_address_space, 4, 1)]
  default_outbound_access_enabled = true
}