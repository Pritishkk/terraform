module "networking" {
  source = "./modules/networking"

  resource_group_name       = var.resource_group_name
  location                  = var.location
  vnet_name                 = var.vnet_name
  nsg_name                  = var.nsg_name
  vnet_address_space        = var.vnet_address_space
  dns_servers               = var.dns_servers
  web_subnet_name           = var.web_subnet_name
  web_subnet_address_prefix = var.web_subnet_address_prefix
  db_subnet_name            = var.db_subnet_name
  db_subnet_address_prefix  = var.db_subnet_address_prefix
  app_subnet_name           = var.app_subnet_name
  app_subnet_address_prefix = var.app_subnet_address_prefix
}

module "compute" {
  source = "./modules/compute"

  resource_group_name                = var.resource_group_name
  location                           = var.location
  azurerm_linux_virtual_machine_name = var.virtual_machine_name
  azurerm_linux_virtual_machine_size = var.virtual_machine_size
  admin_username                     = var.admin_username
  admin_password                     = var.admin_password
  os_disk_managed_disk_type          = var.os_disk_managed_disk_type
  image_publisher                    = var.image_publisher
  image_offer                        = var.image_offer
  image_sku                          = var.image_sku
  image_version                      = var.image_version
  environment                        = var.environment
  function_app_name                  = var.function_app_name
  subnet_id                          = module.networking.app_subnet_id
  key_vault_name                     = var.key_vault_name
}

module "app_service" {
  source     = "./modules/appservice"
  depends_on = [module.networking]

  resource_group_name       = var.resource_group_name
  location                  = var.location
  app_service_plan_name     = var.app_service_plan_name
  app_service_plan_sku_name = var.app_service_plan_sku_name
  app_service_plan_os_type  = var.app_service_plan_os_type
}

module "storage" {
  source     = "./modules/storage"
  depends_on = [module.networking]

  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  storage_account_name      = var.storage_account_name
  container_registry_name   = var.container_registry_name
  app_service_plan_sku_name = var.app_service_plan_sku_name
}
