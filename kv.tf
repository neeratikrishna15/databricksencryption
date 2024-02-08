

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
  name                       = "ngkdbsencryption4518"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
    ]

    secret_permissions = [
      "Set",
    ]
  }
}


resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "a7bf0a9f-6879-434c-9efa-bc6c5bc1f555"
  depends_on = [ azurerm_key_vault.example ]
  key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
    ]

  secret_permissions = [
    "Get",
  ]
}

# resource "azurerm_key_vault_access_policy" "example2" {
#   key_vault_id = azurerm_key_vault.example.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = "2ff814a6-3304-4ab8-85cb-cd0e6f879c1d"
#   depends_on = [ azurerm_key_vault.example ]
#   key_permissions = [
#       "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
#     ]

#   secret_permissions = [
#     "Get",
#   ]
# }