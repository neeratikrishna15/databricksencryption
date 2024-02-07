
resource "azurerm_databricks_workspace" "example" {
  name                = "ngkdatabrickspoc4517"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }
}