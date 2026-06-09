variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
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