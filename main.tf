resource "azurerm_network_interface" "server_nic" {
  name = "${var.server_vm}-nic"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name

  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.target.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "server" {
  name = var.server_vm
  computer_name = "server01"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name
  size = "Standard_B16s_v2"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [azurerm_network_interface.server_nic.id]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb = 1024
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2025-datacenter-g2"
    version = "latest"
  }
}

resource "azurerm_network_interface" "RDatastore01nic" {
  name = "${var.rdatastore1}-nic"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name

  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.target.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "RDatastore01" {
  name = var.rdatastore1
  computer_name = "rdatastore01"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name
  size = "Standard_D4ds_v4"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [azurerm_network_interface.RDatastore01nic.id]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb = 2048
   }

   source_image_reference {
     publisher = "MicrosoftWindowsServer"
     offer = "WindowsServer"
     sku = "2025-datacenter-g2"
     version = "latest"
   }
}

resource "azurerm_network_interface" "portal1vmnic" {
  name = "${var.portal1_vm}-nic"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name

  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.target.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "portal1vm" {
  name = var.portal1_vm
  computer_name = "portal01"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name
  size = "Standard_D4s_v6"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [azurerm_network_interface.portal1vmnic.id]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb = 1024
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2025-datacenter-g2"
    version = "latest"
  }
}

resource "azurerm_network_interface" "odatastore1vmnic" {
  name = "${var.odatastore1}-nic"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name

  ip_configuration {
    name = "internal"
    subnet_id = data.azurerm_subnet.target.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "odatastore1" {
  name = var.odatastore1
  computer_name = "odatastore01"
  location = local.env.location
  resource_group_name = data.azurerm_resource_group.workload.name
  size = "Standard_D4ds_v4"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [azurerm_network_interface.odatastore1vmnic.id]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb = 1024
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2025-datacenter-g2"
    version = "latest"
  }
}


