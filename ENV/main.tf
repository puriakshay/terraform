variable "envrg" {}
variable "envvn" {}
variable "envsn" {}
variable "envni" {}
variable "envpi" {}
variable "envvm" {}

module "mod-rg" {
    source = "../RG"
    varrg = var.envrg
}

module "mod-vn" {
    source = "../VNET"
    varvn = var.envvn
    depends_on = [ module.mod-rg ]
}
module "mod-sn" {
    source = "../SN"
    varsn = var.envsn
    depends_on = [ module.mod-vn ]
}
module "mod-pi" {
    source = "../PI"
    varpi = var.envpi
    depends_on = [ module.mod-rg ]
}
module "mod-ni" {
  source = "../NI"
  varni = var.envni
  vardatasnid = var.envni
  vardatapiid = var.envpi
  depends_on = [ module.mod-pi,module.mod-rg,module.mod-sn ]
}
module "mod-vm" {
    source = "../VM"
    varvm = var.envvm
    vardataniid = var.envni
    depends_on = [module.mod-ni ]
}