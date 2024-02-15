resource "azurerm_key_vault_key" "DatabricksClusterDiskKey" {
  name         = "DatabricksClusterDiskKey"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 4096

  rotation_policy {
    automatic {
      time_before_expiry = "P7D"
    }

    expire_after         = "P1Y"
    notify_before_expiry = "P10D"
  }

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  depends_on = [azurerm_key_vault_access_policy.example2]

}

resource "azurerm_key_vault_key" "DatabricksDBFSKey" {
  name         = "DatabricksDBFSKey"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 4096
  rotation_policy {
    automatic {
      time_before_expiry = "P7D"
    }

    expire_after         = "P1Y"
    notify_before_expiry = "P10D"
  }

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

 depends_on = [azurerm_key_vault_access_policy.example2]

}

resource "azurerm_key_vault_key" "DatabricksManagedServicesKey" {
  name         = "DatabricksManagedServicesKey"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 4096

  rotation_policy {
    automatic {
      time_before_expiry = "P7D"
    }

    expire_after         = "P1Y"
    notify_before_expiry = "P10D"
  }

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
 depends_on = [azurerm_key_vault_access_policy.example2]
 
}