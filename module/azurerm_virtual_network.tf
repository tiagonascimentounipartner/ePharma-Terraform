resource "azurerm_virtual_network" "this" {
  name                = var.name_azure_virtual_network
  location            = var.location_azurerm_resource_group
  resource_group_name = var.resource_group_name_azurerm_virtual_network
  address_space       = var.address_space_azure_virtual_network

  subnet {
    name           = var.name_subnet_azure_virtual_network
    address_prefix = var.address_prefix_subnet_azure_virtual_network
  }
}