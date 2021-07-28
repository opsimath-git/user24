resource "azurerm_lb_nat_rule" "natrule1" {
  resource_group_name            = azurerm_resource_group.user24-rg1.name
  loadbalancer_id                = azurerm_lb.user24-lb.id
  name                           = "web1SSH"
  protocol                       = "Tcp"
  frontend_port                  = 50001	   ### ssh -i ~/.ssh/id_rsa username@LB_VIP -p 50001
  backend_port                   = 22
  frontend_ip_configuration_name = "davidPublicIPAddress"
}

