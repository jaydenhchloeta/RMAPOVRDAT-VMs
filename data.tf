data "azurerm_resource_group" "network" {
  name = local.env.network_rg
}

data "azurerm_resource_group" "workload" {
  name = local.env.workload_rg
}

data "azurerm_virtual_network" "main" {
  name = local.env.vnet_name
  resource_group_name = data.azurerm_resource_group.network.name
}

data "azurerm_subnet" "target" {
  name = local.env.subnet_name
  resource_group_name = data.azurerm_resource_group.network.name
  virtual_network_name = data.azurerm_virtual_network.main.name
}

