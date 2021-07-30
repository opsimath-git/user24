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
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCgo8vucwoUs+kJ+HxEjAjGOWKICH6cuemLUPPfa1Ks1UbDZHG2voiipxKuR2bupHehEJjEdopAsuIcwK4yF01KtqwVxkhA7s1Q7UzAcoUf1PUt5A1nwZU0fH+8lLDqPTWUrB/GgVsEJplm1Inug2JBRx/qBvba6Lb9GulaEXEcMp6XcB4n9a8Fa75doG/VsZdLGFSYwj4pZEFcoMjDKM94lggKfHXLDuzga6JoHWqnVb8YJOp/MmjLnXsJml3DcUHuP8IKlTtzQ3UrOem7P+u1dLlib60OOSkvrVPNmg6KvQtC/+GGru7EHg6bYbShdRYC0fOuLxd+pAzWP5UQbItnSH7pb1kTc9qt3DaROs3Gas6AUy6gmxYojjKiFcxPzjQXdgvaXRVdVkIWJRFSMZeA3LFF7KHmvLITH0FzyK4j9qsmb015UFFxUTmCrJboauIfAVMIswMjIZmSiH4JePg6OmU3VX2HTR4amuXWQ2btB9DbfS0GvsR9y0M3CKcj1h1Pi+9+8pTLA3DyiTJ6vaqFaNQzfratzpU/s1MyJLV2hNphAuAxSzJSOfCrHYZVzxoZM6QwIeUC0fX2OAGsI6qYs5cBCuBKInyxyxzUjhTtO6jBRwgzSPtnEr69QU8Feptio1QzEy1UbPhBBbhndmHGx5bszdkDJY0v1wpbRk7JSw== user24@user24-vm"
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

