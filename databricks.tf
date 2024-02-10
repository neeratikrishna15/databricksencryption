
resource "azurerm_databricks_workspace" "example" {
  name                = "ngkdatabrickspoc4517"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "premium"
  
  customer_managed_key_enabled                        = true
  managed_services_cmk_key_vault_key_id = azurerm_key_vault_key.DatabricksManagedServicesKey.id
  managed_disk_cmk_key_vault_key_id                   = azurerm_key_vault_key.DatabricksClusterDiskKey.id
  managed_disk_cmk_rotation_to_latest_version_enabled = true
  depends_on = [ azurerm_key_vault_access_policy.example2 ]
  
  custom_parameters {
    storage_account_name                                 = "stdatabricks014517"
    storage_account_sku_name                             = "Standard_LRS"
    no_public_ip                                         = true
    virtual_network_id                                   = data.azurerm_virtual_network.vnet.id
    public_subnet_name                                   = data.azurerm_subnet.snet_publ01.name
    private_subnet_name                                  = data.azurerm_subnet.snet_priv01.name
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.databricks_public.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.databricks_private.id
  }
  tags = {
    Environment = "Production"
  }
  
}
#  resource "azurerm_databricks_workspace_root_dbfs_customer_managed_key" "SSDataBricksManagedServicesKey" {
#   workspace_id     = azurerm_databricks_workspace.example.id
#   key_vault_key_id = azurerm_key_vault_key.DatabricksDBFSKey.id
# } 