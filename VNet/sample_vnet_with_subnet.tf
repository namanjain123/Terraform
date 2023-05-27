provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "namanjain"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus"
  resource_group_name = "resourcegroup"
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name = "resourcegroup"
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name = "resourcegroup"
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  resource_group_name = "resourcegroup"
  virtual_network_name = "my-vnet"
  address_prefixes     = ["10.0.3.0/24"]
}
