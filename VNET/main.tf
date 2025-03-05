variable "varvn" {}

resource "azurerm_virtual_network" "vn-block" {
  for_each = var.varvn
  name                = each.value.vnname
  address_space       = each.value.address_space
  location            = each.value.rglocation
  resource_group_name = each.value.rgname
}