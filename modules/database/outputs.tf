output "db_id" {
  value = azurerm_postgresql_server.db.id
}

output "db_fqdn" {
  value = azurerm_postgresql_server.db.fqdn
}

output "db_name" {
  value = azurerm_postgresql_database.app_db.name
}
