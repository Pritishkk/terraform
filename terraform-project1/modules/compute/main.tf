data "azurerm_client_config" "current" {}

resource "random_password" "vm_admin" {
  length  = 20
  lower   = true
  upper   = true
  numeric = true
  special = false
}

resource "azurerm_key_vault" "vm" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Recover",
      "Purge",
      "Update",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Purge",
    ]
  }
}

resource "azurerm_key_vault_secret" "vm_admin_password" {
  name         = "${var.azurerm_linux_virtual_machine_name}-admin-password"
  value        = coalesce(var.admin_password, random_password.vm_admin.result)
  key_vault_id = azurerm_key_vault.vm.id
}

resource "azurerm_public_ip" "main" {
  name                = "${var.azurerm_linux_virtual_machine_name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.azurerm_linux_virtual_machine_name}-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "${var.azurerm_linux_virtual_machine_name}_vm1"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.azurerm_linux_virtual_machine_size
  admin_username                  = var.admin_username
  admin_password                  = azurerm_key_vault_secret.vm_admin_password.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_managed_disk_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = {
    environment = var.environment
  }
}

resource "azurerm_key_vault_access_policy" "vm" {
  key_vault_id = azurerm_key_vault.vm.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_linux_virtual_machine.main.identity[0].principal_id

  secret_permissions = [
    "Get",
    "List",
  ]
}
