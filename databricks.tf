
resource "azurerm_databricks_workspace" "example" {
  name                = "ngkdatabrickspoc4517"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "premium"
  # managed_services_cmk_key_vault_key_id = azurerm_key_vault_key.DatabricksManagedServicesKey.id
  # customer_managed_key_enabled                        = true
  //managed_services_cmk_key_vault_key_id               = azurerm_key_vault_key.DatabricksManagedServicesKey.id
  //managed_disk_cmk_key_vault_key_id                   = azurerm_key_vault_key.DatabricksClusterDiskKey.id
  //managed_disk_cmk_rotation_to_latest_version_enabled = true
  tags = {
    Environment = "Production"
  }
}


/* resource "azurerm_databricks_workspace_root_dbfs_customer_managed_key" "SSDataBricksManagedServicesKey" {
  workspace_id     = azurerm_databricks_workspace.SSDataBricks.id
  key_vault_key_id = azurerm_key_vault_key.DatabricksDBFSKey.id
} */