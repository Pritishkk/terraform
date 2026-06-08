resource "azurerm_resource_group" "main" {
  name     = "${var.rg_name}_resource"
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = "${var.rg_name}storage"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azure_resource_group.main.location
  account_tier             = "Basic"
  account_replication_type = "LRS"
}

resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  admin_enabled       = true
  }

resource "azurerm_network_security_group" "main" {
  name                = var.nsg_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.vnet_address_space
  dns_servers         = var.dns_servers
}

resource "azurerm_subnet" "web" {
  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes     = [var.web_subnet_address_prefix]
}

resource "azurerm_subnet" "db" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes     = [var.db_subnet_address_prefix]
}

resource "azurerm_subnet" "app" {
  name                 = var.app_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes     = [var.app_subnet_address_prefix]
}

resource "azurerm_virtual_network_peering" "web_to_app" {
  name                      = var.rg_name + "-web-to-app-peering"
  resource_group_name       = azurerm_resource_group.main.name
  virtual_network_name      = azurerm_virtual_network.main.name
  remote_virtual_network_id = azurerm_virtual_network.main.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  allow_virtual_network_access = true
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.virtual_machine_name}_vm1"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.virtual_machine_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  storage_os_disk {
    name              = var.virtual_machine_name + "_os_disk"
    caching           = var.os_disk_caching
    create_option     = var.os_disk_create_option
    managed_disk_type = var.os_disk_managed_disk_type
  }
  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.environment
  }
}

resource "azurerm_service_plan" "main" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.main
  location            = azurerm_resource_group.main.location
  os_type             = var.app_service_plan_os_type
  sku_name            = var.app_service_plan_sku_name
}

resource "azurerm_linux_function_app" "example" {
  name                = var.function_app_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  storage_account_name       = azurerm_storage_account.main
  storage_account_access_key = azurerm_storage_account.main.primary_access_key
  service_plan_id            = azurerm_service_plan.main.id

  site_config {}
}