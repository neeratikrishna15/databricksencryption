resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.200.0.0/16"]
  dns_servers         = ["10.200.0.4", "10.200.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

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
    name = "delegation1"

    service_delegation { name       = "Microsoft.Databricks.workspaces",
                           delegation = "Microsoft.Databricks/workspaces",
                           actions    = [ "Microsoft.Network/virtualNetworks/subnets/join/action",
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
  

  delegation {
    name = "delegation2"

    service_delegation { name       = "Microsoft.Databricks.workspaces",
                           delegation = "Microsoft.Databricks/workspaces",
                           actions    = [ "Microsoft.Network/virtualNetworks/subnets/join/action",
                                          "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                                          "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
                                        ]
                        }
  }
}