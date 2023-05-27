provider "azurerm" {
  features {}
}
resource "azurerm_storage_account" "example" {
  name                     = "namanfuncapp"
  resource_group_name      = resource_group
  location                 = westus
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "servicepalan"
  resource_group_name      = resource_group
  location                 = westus
  os_type             = "Linux"
  sku_name            = "V1"
}

resource "azurerm_linux_function_app" "example" {
  name                = "example-linux-function-app"
  resource_group_name      = resource_group
  location                 = westus

  storage_account_name       = namanfuncapp
  storage_account_access_key = naman
  service_plan_id            = servicepalan

  site_config {
    linux_fx_version = "DOCKER|nginx"
  }
}