resource_group_name = "rg-prod"
location            = "centralindia"
storage_account_name = "prodstorageaccount"
container_registry_name = "prodcontainerregistry"
vnet_name = "prod-vnet"
nsg_name = "prod-nsg"
vnet_address_space = ["10.20.0.0/16"]
dns_servers = ["10.20.0.4", "10.20.0.5"]
web_subnet_name = "web-subnet"
web_subnet_address_prefix = "10.20.1.0/24"
db_subnet_address_prefix = "10.20.2.0/24"
app_subnet_address_prefix = "10.20.3.0/24"
virtual_machine_name = "prod-vm"
admin_username = "azureuser"
admin_password = "Prod_P@ssw0rd1234"
virtual_machine_size = "Standard_DS1_v2"
image_publisher = "MicrosoftWindowsServer"
image_offer = "WindowsServer"
image_sku = "2019-Datacenter"
image_version = "latest"
os_disk_caching = "value"
os_disk_create_option = "FromImage"
os_disk_managed_disk_type = "Standard_LRS"
computer_name = "prod-vm1"
environment = "production"
app_service_plan_name = "prod-app-service-plan"
app_service_plan_sku_name = "S1"





