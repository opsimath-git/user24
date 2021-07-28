resource "azurerm_storage_account" "mystorageaccount" {
    name                = "user24vm1diagestorage1"
    resource_group_name = azurerm_resource_group.user24-rg1.name
    location = azurerm_resource_group.user24-rg1.location
    account_replication_type = "LRS"
    account_tier = "Standard"

    tags = {
        environment = "Terraform Demo"
    }
}

