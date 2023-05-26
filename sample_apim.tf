provider "azurerm" {
  features {}
}

resource "azurerm_api_management" "example" {
  name                = "example-apim"
  location            = "eastus"
  resource_group_name = "example-resource-group"

  sku_name = "Developer_1"

  publisher_name       = "namanjain"
  publisher_email      = "namanjain@example.com"
  notification_sender_email = "notification-email@example.com"

  tags = {
    environment = "production"
  }

  virtual_network_configuration {
    subnet_id = azurerm_subnet.example.id
  }

  custom_hostname_configuration {
    hostname = "api.example.com"
    certificate {
      thumbprint          = "1234567890"
      thumbprint_algorithm = "SHA-1"
    }
  }
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = resourcegroup
  virtual_network_name = myTFVnet
  address_prefixes     = ["10.0.1.0/24"]
}


