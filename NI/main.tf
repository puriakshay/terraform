variable "varni" {}
variable "vardatasnid" {} 
variable "vardatapiid" {}


data "azurerm_subnet" "snid-block" {
  for_each = var.vardatasnid
  name                 = each.value.snname
  virtual_network_name = each.value.vnname
  resource_group_name  = each.value.rgname
}

data "azurerm_public_ip" "pi-block" {
  for_each = var.vardatapiid
  name                = each.value.piname
  resource_group_name = each.value.rgname
}

resource "azurerm_network_interface" "ni-blok" {
  for_each = var.varni
  name                = each.value.niname
  location            = each.value.rglocation
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = each.value.ipname
    subnet_id                     = data.azurerm_subnet.snid-block[each.key].id
    private_ip_address_allocation = each.value.address_allocation
    public_ip_address_id = data.azurerm_public_ip.pi-block[each.key].id
  } 
}