output "lb_nsg_id" {
  value = azurerm_network_security_group.lb_nsg.id
}

output "web_nsg_id" {
  value = azurerm_network_security_group.web_nsg.id
}

output "db_nsg_id" {
  value = azurerm_network_security_group.db_nsg.id
}
