resource "azurerm_lb_probe" "user24-lb-probe" {
    resource_group_name = azurerm_resource_group.user24-rg1.name
    loadbalancer_id = azurerm_lb.user24-lb.id
    name = "http-probe"
    protocol = "Http"
    request_path = "/"
    port = 80
}
