output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "public_subnet_id" {
  value = azurerm_subnet.public.id
}

output "web_subnet_id" {
  value = azurerm_subnet.web.id
}

output "db_subnet_id" {
  value = azurerm_subnet.db.id
}