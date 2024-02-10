resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.200.0.0/16"]
  dns_servers         = ["10.200.0.4", "10.200.0.5"]

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "dbs-public" {
  name                 = "dbs-public"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.200.4.0/24"]

}

resource "azurerm_subnet" "dbs-private" {
  name                 = "dbs-private"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.200.5.0/24"]
  

}
