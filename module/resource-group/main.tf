# resource "azurerm_resource_group" "this" {
#   name     = var.name
#   location = var.location
#   tags     = var.tags
# }

resource "azurerm_resource_group" "gsi-ne-dev-epharma-rg001" {
  name     = var.name
  location = var.location
  tags     = var.tags
}