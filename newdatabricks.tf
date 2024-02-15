resource "azurerm_databricks_workspace" "workspac03" {
    name                = "ngkdatabrickspoc101"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "premium"
  public_network_access_enabled = true
  managed_resource_group_name   = "rg-managed-dbw-ds03"
  customer_managed_key_enabled                        = true
  managed_services_cmk_key_vault_key_id               = azurerm_key_vault_key.DatabricksManagedServicesKey.id
  managed_disk_cmk_key_vault_key_id                   = azurerm_key_vault_key.DatabricksClusterDiskKey.id
  managed_disk_cmk_rotation_to_latest_version_enabled = true
    
  custom_parameters {
    virtual_network_id                                   = azurerm_virtual_network.example.id
    public_subnet_name                                   = azurerm_subnet.dbs-public.name
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.databricks_public.id
    private_subnet_name                                  = azurerm_subnet.dbs-private.name
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.databricks_private.id
    nat_gateway_name                                     = null
    public_ip_name                                       = null
    no_public_ip                                         = false
    storage_account_name                                 = null
    storage_account_sku_name                             = null
  
  }
}

data "azurerm_databricks_workspace" "workspac03" {
  name                = azurerm_databricks_workspace.workspac03.name
  resource_group_name = azurerm_databricks_workspace.workspac03.resource_group_name
}

# resource "databricks_workspace_conf" "workspac03" {
#   custom_config = {
#     "storeInteractiveNotebookResultsInCustomerAccount" = true
#   }

#   depends_on = [data.azurerm_databricks_workspace.workspac03]
# }

 resource "azurerm_databricks_workspace_root_dbfs_customer_managed_key" "workspac03" {
  workspace_id     = azurerm_databricks_workspace.workspac03.id
  key_vault_key_id = azurerm_key_vault_key.DatabricksDBFSKey.id
} 