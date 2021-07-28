resource "azurerm_lb_rule" "lbrule" {
    resource_group_name = azurerm_resource_group.user24-rg1.name
    loadbalancer_id = azurerm_lb.user24-lb.id
    name = "http"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    backend_address_pool_id = azurerm_lb_backend_address_pool.user24-bpepool.id
    frontend_ip_configuration_name = "user24PublicIPAddress"
    probe_id = azurerm_lb_probe.user24-lb-probe.id
}
