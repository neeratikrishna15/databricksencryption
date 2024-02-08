
resource "azurerm_databricks_workspace" "example" {
  name                = "ngkdatabrickspoc4517"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "premium"
  #managed_services_cmk_key_vault_key_id = azurerm_key_vault_key.generated.id

  tags = {
    Environment = "Production"
  }
}