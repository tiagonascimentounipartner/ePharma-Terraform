module "resource-group" {
  source = "./module/resource-group"

  name     = var.name
  location = var.location
  tags     = var.tags
}

# module "resource-group" {
#   source = "../module/resource-group"

#   name     = var.name_azure_virtual_network
#   location = var.location
#   tags     = var.tags
# }

# module "azurerm_virtual_network" {
#   source = "../module/azurerm_virtual_network"

#   name     = var.name_azure_virtual_network
#   location = var.location_azurerm_resource_group
#   tags     = var.tags
# }

# resource "azurerm_resource_group" "rgvnetname" {
#   name     = "gsi-ne-shared-netsec-rg001"
#   location = "North Europe"
#   tags = {
#     project     = "epharma"
#     environment = "shared"
#   }
# }

# resource "azurerm_resource_group" "rgsrvname" {
#   name     = "gsi-ne-prd-servers-rg001"
#   location = "North Europe"
#   tags = {
#     project     = "epharma"
#     environment = "prd"
#   }
# }

# resource "azurerm_virtual_network" "vnethubname" {
#   name                = "gsi-ne-hub-vnet001"
#   resource_group_name = azurerm_resource_group.rgvnetname.name
#   location            = azurerm_resource_group.rgvnetname.location

#   address_space = ["172.20.0.0/24"]
# }

# resource "azurerm_subnet" "snethubname" {
#   name                 = "gsi-ne-hub-snet001"
#   resource_group_name  = azurerm_resource_group.rgvnetname.name
#   address_prefixes     = ["172.20.0.0/27"]
#   virtual_network_name = azurerm_virtual_network.vnethubname.name
# }

# resource "azurerm_virtual_network" "vnetname" {
#   name                = "gsi-ne-srv-vnet001"
#   resource_group_name = azurerm_resource_group.rgvnetname.name
#   location            = azurerm_resource_group.rgvnetname.location

#   address_space = ["172.10.0.0/24"]
# }

# resource "azurerm_subnet" "snetname" {
#   name                 = "gsi-ne-srv-snet001"
#   resource_group_name  = azurerm_resource_group.rgvnetname.name
#   address_prefixes     = ["172.10.0.0/26"]
#   virtual_network_name = azurerm_virtual_network.vnetname.name
# }

# resource "azurerm_network_interface" "nicvm" {
#   name                = "${var.prefix}01-nic"
#   resource_group_name = azurerm_resource_group.rgsrvname.name
#   location            = azurerm_resource_group.rgsrvname.location

#   ip_configuration {
#     name                          = "ipconfig1"
#     subnet_id                     = azurerm_subnet.snetname.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_windows_virtual_machine" "vmgsi" {
#   name                  = "${var.prefix}01"
#   resource_group_name   = azurerm_resource_group.rgsrvname.name
#   location              = azurerm_resource_group.rgsrvname.location
#   network_interface_ids = [azurerm_network_interface.nicvm.id]
#   size                  = "Standard_B8ms"
#   admin_username        = "admingsivm"
#   admin_password        = "LIS@gsi#2099mm"

#   os_disk {
#     name                 = "${var.prefix}01-OSdisk"
#     caching              = "ReadWrite"
#     storage_account_type = "StandardSSD_LRS"
#   }
#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2022-Datacenter"
#     version   = "latest"
#   }
# }

# data "azurerm_resource_group" "rgname" {
#   name = "gsi-ne-dev-epharma-rg001"
# }

# resource "azurerm_service_plan" "appservplan" {
#   name                = "gsi-ne-dev-epharma-asp001"
#   resource_group_name = data.azurerm_resource_group.rgname.name
#   location            = data.azurerm_resource_group.rgname.location
#   os_type             = "Linux"
#   sku_name            = "B1"
# }

# resource "azurerm_linux_web_app" "webapp" {
#   name                = "gsi-ne-dev-epharma-portal-lwapp001"
#   resource_group_name = data.azurerm_resource_group.rgname.name
#   location            = data.azurerm_resource_group.rgname.location
#   service_plan_id     = azurerm_service_plan.appservplan.id
#   https_only          = true
#   site_config {
#     minimum_tls_version = "1.2"
#   }
# }

# resource "azurerm_api_management" "apim" {
#   name                = "gsi-ne-dev-epharma-azpim001"
#   resource_group_name = data.azurerm_resource_group.rgname.name
#   location            = data.azurerm_resource_group.rgname.location
#   sku_name            = var.sku_name
#   publisher_name      = "gsiepharmadev"
#   publisher_email     = "nuno.madureira@gsiportugal.com"
# }

# resource "azurerm_servicebus_namespace" "servicebus" {
#   name                = "gsi-ne-dev-epharma-sb001"
#   resource_group_name = data.azurerm_resource_group.rgname.name
#   location            = data.azurerm_resource_group.rgname.location
#   sku                 = "Standard"
# }

# resource "azurerm_storage_account" "straccruntime" {
#   name                     = "gsidevepharmartsa001"
#   resource_group_name      = data.azurerm_resource_group.rgname.name
#   location                 = data.azurerm_resource_group.rgname.location
#   account_kind             = "StorageV2"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_account" "straccarchive" {
#   name                     = "gsidevepharmaarcsa001"
#   resource_group_name      = data.azurerm_resource_group.rgname.name
#   location                 = data.azurerm_resource_group.rgname.location
#   account_kind             = "StorageV2"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_redis_cache" "rediscache" {
#   name                = "gsi-ne-dev-epharma-rc001"
#   resource_group_name = data.azurerm_resource_group.rgname.name
#   location            = data.azurerm_resource_group.rgname.location
#   sku_name            = "Basic"
#   capacity            = 0
#   family              = "C"
# }