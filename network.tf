resource "azurerm_virtual_network" "this" {
  name                = "vnet-complience-01"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["192.168.10.0/24"]
}

resource "azurerm_subnet" "first" {
  name                            = "snet-first"
  resource_group_name             = azurerm_resource_group.this.name
  virtual_network_name            = azurerm_virtual_network.this.name
  address_prefixes                = [cidrsubnet(azurerm_virtual_network.this.address_space, 4, 1)]
  default_outbound_access_enabled = false
}