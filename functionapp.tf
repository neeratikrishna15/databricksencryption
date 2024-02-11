resource "azurerm_virtual_network" "example" {
  name                = "taintnetwork"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.199.0.0/16"]
}