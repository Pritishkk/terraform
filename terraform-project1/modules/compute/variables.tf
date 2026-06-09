variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "azurerm_linux_virtual_machine_name" {
  description = "The name of the Linux virtual machine"
  type        = string
}

variable "azurerm_linux_virtual_machine_size" {
  description = "The size of the Linux virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Linux virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Linux virtual machine"
  type        = string
  default     = null
  sensitive   = true
}

variable "os_disk_managed_disk_type" {
  description = "The managed disk type for the OS disk"
  type        = string
}

variable "image_publisher" {
  description = "The publisher of the virtual machine image"
  type        = string
}

variable "image_offer" {
  description = "The offer of the virtual machine image"
  type        = string
}

variable "image_sku" {
  description = "The SKU of the virtual machine image"
  type        = string
}

variable "image_version" {
  description = "The version of the virtual machine image"
  type        = string
}

variable "environment" {
  description = "The environment for the virtual machine"
  type        = string
}

variable "function_app_name" {
  description = "The name of the Function App"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the virtual machine network interface"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault used by the virtual machine"
  type        = string
}
