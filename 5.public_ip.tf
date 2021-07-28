resource "azurerm_public_ip" "user24-publicip" {  
name                = "mypublicIP"  
location            = azurerm_resource_group.user24-rg1.location  
resource_group_name = azurerm_resource_group.user24-rg1.name  
allocation_method   = "Static"  
domain_name_label   = azurerm_resource_group.user24-rg1.name  
	tags = {    
		environment = "staging"  
	}

}
