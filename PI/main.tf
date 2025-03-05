variable "varpi" {}

resource "azurerm_public_ip" "pi-block" {
    for_each = var.varpi
  name                = each.value.piname
  resource_group_name = each.value.rgname
  location            = each.value.rglocation
  allocation_method   = each.value.allocation_method
}