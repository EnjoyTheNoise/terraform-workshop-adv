resource "azurerm_resource_group" "my_rg" {
  name     = "task-rg"
  location = "westeurope"
}

resource "azurerm_network_security_group" "example" {
  name                = "my-nsg"
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
}

locals{
  rules = [
    {

    }
  ]
}

resource "azurerm_network_security_rule" "example" {
  name                        = "ma być z for_each"
  priority                    = "ma być z for_each"
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.my_rg.name
  network_security_group_name = azurerm_network_security_group.example.name
}
