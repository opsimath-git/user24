resource "azurerm_subnet" "user24-subnet1" {
        name                            = "user24-subnet1"
        resource_group_name    = var.resource_group
        virtual_network_name    = var.vnet
        address_prefixes        = ["24.0.1.0/24"]
}