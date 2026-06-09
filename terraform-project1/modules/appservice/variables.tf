variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}

variable "location" {
    description = "The Azure region where resources will be created"
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
    description = "The OS type of the App Service Plan (e.g., Windows, Linux)"
    type        = string
}


