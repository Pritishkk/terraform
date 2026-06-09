variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_registry_name" {
  description = "The name of the container registry"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "The list of DNS servers for the virtual network"
  type        = list(string)
}

variable "web_subnet_name" {
  description = "The name of the web subnet"
  type        = string
}

variable "web_subnet_address_prefix" {
  description = "The address prefix for the web subnet"
  type        = string
}

variable "db_subnet_name" {
  description = "The name of the database subnet"
  type        = string
}

variable "db_subnet_address_prefix" {
  description = "The address prefix for the database subnet"
  type        = string
}

variable "app_subnet_name" {
  description = "The name of the application subnet"
  type        = string
}

variable "app_subnet_address_prefix" {
  description = "The address prefix for the application subnet"
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the Linux virtual machine"
  type        = string
}

variable "virtual_machine_size" {
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

variable "key_vault_name" {
  description = "The name of the Key Vault used by the virtual machine"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "app_service_plan_sku_name" {
  description = "The SKU of the App Service Plan"
  type        = string
}

variable "app_service_plan_os_type" {
  description = "The OS type of the App Service Plan"
  type        = string
}
