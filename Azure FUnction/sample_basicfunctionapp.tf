provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "example" {
  name                     = "namanfuncapp"
  resource_group_name      = "resourcegroup"
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "example" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus"
  resource_group_name = "resourcegroup"
}

resource "azurerm_subnet" "example" {
  name                 = "function-app-subnet"
  resource_group_name  = "resourcegroup"
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints     = ["Microsoft.Web"]
}

resource "azurerm_service_plan" "example" {
  name                     = "serviceplan"
  resource_group_name      = "resourcegroup"
  location                 = "westus"
  sku_name                 = "Y1"
  per_site_scaling_enabled = true
}

resource "azurerm_linux_function_app" "example" {
  name                     = "example-linux-function-app"
  resource_group_name      = "resourcegroup"
  location                 = "westus"

  storage_account_name       = "namanfuncapp"
  storage_account_access_key = "key"
  app_service_plan_id        = "id"

  site_config {
    linux_fx_version = "DOCKER|nginx"
  }

  app_settings = {
    "WEBSITES_PORT" = "80"
  }

  subnet_id = "function-app-subnet"
}
