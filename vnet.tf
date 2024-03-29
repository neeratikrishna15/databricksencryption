resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.200.0.0/16"]
  dns_servers         = ["10.200.0.4", "10.200.0.5"]

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "dbs-public" {
  name                 = "dbs-public"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.200.4.0/24"]
  delegation {
    name = "databricks"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action",
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                                        ]
    }
  }
  }


resource "azurerm_subnet" "dbs-private" {
  name                 = "dbs-private"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.200.5.0/24"]
  service_endpoints   = ["Microsoft.Storage", "Microsoft.KeyVault"]
  delegation {
    name = "databricks"
    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action",
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                                        ]
    }
  }

}
resource "azurerm_network_security_group" "defaulfnsg" {
  name = "dbs-nsg"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  
  
  
}
resource "azurerm_subnet_network_security_group_association" "databricks_private" {
  subnet_id                 = azurerm_subnet.dbs-private.id
  network_security_group_id = azurerm_network_security_group.defaulfnsg.id
}
resource "azurerm_subnet_network_security_group_association" "databricks_public" {
  subnet_id                 = azurerm_subnet.dbs-public.id
  network_security_group_id = azurerm_network_security_group.defaulfnsg.id
}
