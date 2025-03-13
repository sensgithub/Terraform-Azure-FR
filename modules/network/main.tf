resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}-${var.environment}-vnet"
  address_space       = ["10.0.0.0/24"]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "public" {
  name                 = "${var.project_name}-${var.environment}-public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.16/28"]
}

resource "azurerm_subnet" "web" {
  name                 = "${var.project_name}-${var.environment}-web-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.32/28"]
}

resource "azurerm_subnet" "db" {
  name                 = "${var.project_name}-${var.environment}-db-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.64/28"]
  service_endpoints    = ["Microsoft.Sql"]
}

