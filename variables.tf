variable "vnet_name" {
  type        = string
  description = "Name of the vNet."
}

variable "vm_subnet_name" {
  type        = string
  description = "Name of the subnet."
}

variable "vm_resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "vnet_resource_group_name" {
  type        = string
  description = "Name of the vNet's resource group."
}

variable "vm_username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
}

variable "vm_password" {
  type        = string
  description = "The password for the local account that will be created on the new VM."
  sensitive   = true
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine."
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine."
  default     = "Standard_B1s"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to all resources."
  default     = {}
}

variable "os_disk_caching" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk."
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS."
  default     = "Premium_LRS"
}

variable "image_publisher" {
  type        = string
  description = "Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from."
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines."
  default     = "WindowsServer"
}

variable "image_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines."
  default     = "2019-Datacenter"
}

variable "image_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machines."
  default     = "latest"
}
