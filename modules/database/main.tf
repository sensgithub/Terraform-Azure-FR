# data "azurerm_resource_group" "vnet" {
#   name = "flatr0ck-tf-res-g"
# }

# data "azurerm_subnet" "vnet_subnet" {
#   name                 = "${var.project_name}-${var.environment}-db-subnet"
#   virtual_network_name = "${var.project_name}-${var.environment}-vnet"
#   resource_group_name  = "flatr0ck-tf-res-g"
# }

resource "azurerm_postgresql_server" "db" {
  name                = "${var.project_name}-${var.environment}-psql"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password

  sku_name   = var.db_sku_name
  version    = var.db_version
  storage_mb = var.db_storage_mb

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  public_network_access_enabled = false
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "app_db" {
  name                = "${var.project_name}_${var.environment}_db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.db.name
  charset             = "UTF8"
  collation           = "en-US"
}

resource "azurerm_private_endpoint" "privatendpoint" {
  name                = "${var.project_name}-${var.environment}-pp"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.project_name}-${var.environment}-p-privateserviceconnection"
    private_connection_resource_id = azurerm_postgresql_server.db.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }
}