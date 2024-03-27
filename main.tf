# The main configuration file where all the resources are defined

data "azurerm_subnet" "vm_subnet" {
  name                 = var.vm_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group_name
}

# Creates a network interface
resource "azurerm_network_interface" "vm_nic" {
  name                = "nic-${var.vm_name}"
  location            = var.vm_resource_group_location
  resource_group_name = var.vnet_resource_group_name

  ip_configuration {
    name                          = "${var.vm_name}_nic_configuration"
    subnet_id                     = data.azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = merge(
    var.tags,
    {
      Environment     = "Demo",
      Owner           = "ServiceNow"
      ServiceNow_RITM = terraform.workspace
    },
  )
}

# Creates a Virtual Machine
resource "azurerm_windows_virtual_machine" "vm" {
  name                  = "vm-${var.vm_name}"
  location              = var.vm_resource_group_location
  resource_group_name   = var.vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  size                  = var.vm_size

  os_disk {
    name                 = "osdisk-${var.vm_name}"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  computer_name  = var.vm_name
  admin_username = var.vm_username
  admin_password = var.vm_password
  #disable_password_authentication = false

  tags = merge(
    var.tags,
    {
      Environment     = "Demo",
      Owner           = "ServiceNow"
      ServiceNow_RITM = terraform.workspace
    },
  )
}