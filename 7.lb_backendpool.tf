resource "azurerm_lb_backend_address_pool" "user24-bpepool" {
    resource_group_name = azurerm_resource_group.user24-rg1.name
    loadbalancer_id = azurerm_lb.user24-lb.id
    name = "user24-BackEndAddressPool"
}
