variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
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

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "The DNS servers for the virtual network"
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
  description = "The name of the db subnet"
  type        = string
}

variable "db_subnet_address_prefix" {
  description = "The address prefix for the db subnet"
  type        = string
}

variable "app_subnet_name" {
  description = "The name of the app subnet"
  type        = string
}

variable "app_subnet_address_prefix" {
  description = "The address prefix for the app subnet"
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine"
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

variable "os_disk_caching" {
  description = "The caching type for the OS disk"
  type        = string
}

variable "os_disk_create_option" {
  description = "The create option for the OS disk"
  type        = string
}

variable "os_disk_managed_disk_type" {
  description = "The managed disk type for the OS disk"
  type        = string
}

variable "computer_name" {
  description = "The computer name for the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
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
  description = "The operating system type for the App Service Plan"
  type        = string
}

variable "function_app_name" {
  description = "The name of the Function App"
  type        = string
}

variable "function_app_runtime" {
  description = "The runtime stack for the Function App"
  type        = string
}