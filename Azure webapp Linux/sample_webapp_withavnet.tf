resource "azurerm_app_service_plan" "example" {
  name                = "my-app-service-plan"
  location            = westus
  resource_group_name = resource_group
  sku {
    tier = "Standard"
    size = "V1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "naman"
  location            = westus
  resource_group_name = resource_group
  app_service_plan_id = my-app-service-plan

  site_config {
    linux_fx_version = "DOCKER|nginx"
  }

  app_settings = {
    "WEBSITES_PORT" = "80"
  }

  depends_on = [my-subnet]
}

resource "azurerm_virtual_network" "example" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = westus
  resource_group_name = resource_group
}
resource "azurerm_subnet" "example" {
  name                 = "my-subnet"
  resource_group_name  = resource_group
  virtual_network_name = my-vnet
  address_prefixes     = ["10.0.1.0/24"]
}

