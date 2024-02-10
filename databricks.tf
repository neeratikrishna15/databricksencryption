

#  resource "azurerm_databricks_workspace_root_dbfs_customer_managed_key" "SSDataBricksManagedServicesKey" {
#   workspace_id     = azurerm_databricks_workspace.example.id
#   key_vault_key_id = azurerm_key_vault_key.DatabricksDBFSKey.id
# } 