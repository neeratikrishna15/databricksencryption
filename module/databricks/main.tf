
resource "azurerm_databricks_workspace" "dbw" {
  name                                                = var.name
  resource_group_name                                 = var.resource_group_name
  location                                            = var.location
  sku                                                 = var.sku
  managed_services_cmk_key_vault_key_id               = var.managed_services_cmk_key_vault_key_id
  managed_disk_cmk_key_vault_key_id                   = var.managed_disk_cmk_key_vault_key_id
  managed_disk_cmk_rotation_to_latest_version_enabled = var.managed_disk_cmk_rotation_to_latest_version_enabled
  managed_resource_group_name                         = var.managed_resource_group_name
  customer_managed_key_enabled                        = var.customer_managed_key_enabled
  infrastructure_encryption_enabled                   = var.infrastructure_encryption_enabled
  public_network_access_enabled                       = var.public_network_access_enabled
  network_security_group_rules_required               = var.network_security_group_rules_required
  tags                                                = var.tags

  dynamic "custom_parameters" {
    for_each = var.custom_parameters != null ? [var.custom_parameters] : []
    content {
      nat_gateway_name                                     = custom_parameters.value.nat_gateway_name
      public_ip_name                                       = custom_parameters.value.public_ip_name
      no_public_ip                                         = custom_parameters.value.no_public_ip
      public_subnet_name                                   = custom_parameters.value.public_subnet_name
      public_subnet_network_security_group_association_id  = custom_parameters.value.public_subnet_network_security_group_association_id
      private_subnet_name                                  = custom_parameters.value.private_subnet_name
      private_subnet_network_security_group_association_id = custom_parameters.value.private_subnet_network_security_group_association_id
      storage_account_name                                 = custom_parameters.value.storage_account_name
      storage_account_sku_name                             = custom_parameters.value.storage_account_sku_name
      virtual_network_id                                   = custom_parameters.value.virtual_network_id
      vnet_address_prefix                                  = custom_parameters.value.vnet_address_prefix
    }
  }
}
