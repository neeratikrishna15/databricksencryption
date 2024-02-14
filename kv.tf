

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
  name                       = "ngkdbsencryption99"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  purge_protection_enabled   = true
  
}


resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "a7bf0a9f-6879-434c-9efa-bc6c5bc1f555"
  depends_on = [ azurerm_key_vault_access_policy.example4 ]
  key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
    ]

  secret_permissions = [
    "Get",
  ]
}

resource "azurerm_key_vault_access_policy" "example2" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "f3680875-c4e1-4d30-8901-37c638dbf98f"
  depends_on = [ azurerm_key_vault_access_policy.example4 ]
  key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
    ]

  secret_permissions = [
    "Get","List"
  ]
}

resource "azurerm_key_vault_access_policy" "example3" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "f12bddc4-d711-4a99-8c5d-d1c28a7457d4"
  depends_on = [ azurerm_key_vault_access_policy.example4 ]
  key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
    ]

  secret_permissions = [
    "Get","List"
  ]
  
}

resource "azurerm_key_vault_access_policy" "example4" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  depends_on = [ azurerm_key_vault.example ]
  key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
    ]

  secret_permissions = [
    "Get","List"
  ]
}


resource "azurerm_key_vault_access_policy" "example5" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_databricks_workspace.workspac02.disk_encryption_set_id
  depends_on = [ azurerm_key_vault.example ]
  key_permissions = [
      "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Restore", "Decrypt", "Encrypt", "UnwrapKey", "WrapKey", "Verify", "Sign", "Purge", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy",
      
    ]

  secret_permissions = [
    "Get","List"
  ]
}

