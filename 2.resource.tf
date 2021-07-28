resource "azurerm_resource_group" "user24-rg1" {
    name     = var.resource_group
    location = var.region

    tags = {
        environment = "Final Test by user24"
    }
}
