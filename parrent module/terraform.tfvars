rgs = {
  rg1 = {
    name     = "bhatt_rg"
    location = "centralindia"
  }
  rg2 = {
    name     = "bhatt2_rg"
    location = "centralindia"
  }

  rg3 = {
    name     = "bhatt3_rg"
    location = "centralindia"
  }
}

vnet = {
  vnet1 = {
    name          = "vnet_rahul"
    location      = "centralindia"
    rgs           = "bhatt_rg"
    address_space = ["10.1.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name            = "rahul_front"
    rgs             = "bhatt_rg"
    vnet_name       = "vnet_rahul"
    address_prefixe = ["10.1.1.0/24"]
  }
  subnet2 = {
    name            = "rahul_back"
    rgs             = "bhatt_rg"
    vnet_name       = "vnet_rahul"
    address_prefixe = ["10.1.2.0/24"]
  }
}

pip = {
  pip1 = {
    name              = "rahul_front_pip"
    rgs               = "bhatt_rg"
    location          = "centralindia"
    allocation_method = "Static"
  }
  pip2 = {
    name     = "rahul_back_pip"
    rgs      = "bhatt_rg"
    location = "centralindia"
  allocation_method = "Static" }
}

vms = {
  vm1 = {
    nic_name                      = "rahul_nic"
    location                      = "centralindia"
    rgs                           = "bhatt_rg"
    pip_name                      = "rahul_front_pip"
    subnet_name                   = "rahul_front"
    ip_name                       = "internal"
    private_ip_address_allocation = "Dynamic"
    vnet                          = "vnet_rahul"
    vm_name                       = "rahulvm01"
    size                          = "Standard_B2ts_v2"
    username                      = "rahuladmin"
    admin_password                = "rahul#8947"
    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"
    publisher                     = "Canonical"
    offer                         = "0001-com-ubuntu-server-jammy"
    sku                           = "22.04-LTS"
    version                       = "latest"
  }
}