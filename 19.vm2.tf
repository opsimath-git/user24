resource "azurerm_virtual_machine" "web2" {
    name                  = "user24web2"
    location              = azurerm_resource_group.user24-rg1.location
    resource_group_name   = azurerm_resource_group.user24-rg1.name
    availability_set_id   = azurerm_availability_set.avset.id
    network_interface_ids = [azurerm_network_interface.nic2.id]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk2"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }
    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

 os_profile {
        computer_name  = "user24web2"
        admin_username = "user24"
        admin_password = "eogksalsrnr2!#"
	custom_data= file("web.sh")
    }

 os_profile_linux_config {
        disable_password_authentication = false
        ssh_keys {
            path     = "/home/user24/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDshorz5jfon3B9NzBecbpjXl0SmRf/haN1vA+0go8WEzb/3EryXg9AG3Fup8X+x0QbBfs3KHIEpkTebQvhlNsphLfddSIPQtWJsH222F0EQjPgeiVJxfPtXD7Qg56RLrJq3DlmdyM0N/qPU7fwOXGs2OtNTdaIfj9y5VU8sXQPhyINEEPxifG6O3cCn/yszCDFZV33YjJcYv8FlSRfoDYt3V8Usznv7eBBtzr+ZOD3BVPGqf7fHBtH+ml0isOmIlxNT8Ackq/R0/er+APKB8C0wKe3ezkVcsyTQZbnjO7wIx0BKhGCyjwWHtQ7+9IVWp5t9okaFcAsfMGqcIWA1LyF4nyQzbwXOBm7ar5kHHSAL8OQaPIRxRgtvP/QTZdMghWo4kLdhuXD/PbJ4l1v3JwXQoO0DuGrXUibY2BfIMxlRF9YY/tMb7iT3WI7dpAN68Y+56byX8P7fsKIZBMuBqPzdJZW0CENAnOKrjn3t6pMlcHh3fZRpedCjiwhZ533P8E= user24@user24-vm"
        }
    }
    boot_diagnostics {
        enabled     = "true"
        storage_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "Terraform Demo"
    }
}

