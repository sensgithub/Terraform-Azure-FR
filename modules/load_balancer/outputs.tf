output "lb_id" {
  value = azurerm_lb.lb.id
}

output "lb_ip" {
  value = azurerm_public_ip.lb_ip.ip_address
}

output "backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

# output "health_probe_id" {
#   value = azurerm_lb_probe.http_probe.id
# }