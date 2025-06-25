# Naming
locals {
  rg_name = format("rg-%s-%s-%s", var.env, var.usecase, var.suffix)
}

# VNet
locals {
  vnet_address_space = "192.168.10.0/24"
}