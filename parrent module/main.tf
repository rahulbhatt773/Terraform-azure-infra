module "rg" {
  source = "../child_module/azurerm_resource_group"
  rgs=var.rgs
}

module "vnet" {
  depends_on = [ module.rg ]
  source = "../child_module/azurerm_virtual_network"
  vnet = var.vnet
}

module "subnet" {
  depends_on = [ module.vnet ]
  source = "../child_module/azurerm_subnet"
  subnet = var.subnet
}

module "pip" {
  depends_on = [ module.rg ]
  source = "../child_module/azurerm_public_ip"
  pip = var.pip
}

module "vm" {
  depends_on = [module.rg, module.vnet, module.subnet,module.pip ]
  source = "../child_module/azurerm_virtual_machine"
  vms = var.vms
}