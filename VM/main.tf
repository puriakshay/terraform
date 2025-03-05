variable "varvm" {}
variable "vardataniid" {}

data "azurerm_network_interface" "datablocknid" {
  for_each = var.vardataniid
  name                = each.value.niname
  resource_group_name = each.value.rgname
}

resource "azurerm_linux_virtual_machine" "vm-block" {
  for_each = var.varvm
  name                = each.value.vmname
  resource_group_name = each.value.rgname
  location            = each.value.rglocation
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  network_interface_ids = [data.azurerm_network_interface.datablocknid[each.key].id]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}