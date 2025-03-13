resource "azurerm_network_security_group" "lb_nsg" {
  name                = "${var.project_name}-${var.environment}-lb-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  security_rule {
    name                       = "allow-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "web_nsg" {
  name                = "${var.project_name}-${var.environment}-web-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  security_rule {
    name                       = "allow-lb"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-ssh"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "db_nsg" {
  name                = "${var.project_name}-${var.environment}-db-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  security_rule {
    name                       = "allow-postgres"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "10.0.0.32/28"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "web_nsg_association" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "db_nsg_association" {
  subnet_id                 = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.db_nsg.id
}
