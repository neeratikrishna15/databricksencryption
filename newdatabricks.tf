resource "azurerm_databricks_workspace" "workspac02" {
    name                = "ngkdatabrickspoc45"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "premium"
  public_network_access_enabled = true
  managed_resource_group_name   = "rg-managed-dbw-ds01"
  
  custom_parameters {
    virtual_network_id                                   = azurerm_virtual_network.example.id
    public_subnet_name                                   = azurerm_subnet.dbs-public.name
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.databricks_public.id
    private_subnet_name                                  = azurerm_subnet.dbs-private.name
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.databricks_private.id
    nat_gateway_name                                     = null
    public_ip_name                                       = null
    no_public_ip                                         = true
    storage_account_name                                 = null
    storage_account_sku_name                             = null
    virtual_network_address_space                        = azurerm_virtual_network.example.address_space
    vnet_address_prefix                                  = null
  
  }
}

