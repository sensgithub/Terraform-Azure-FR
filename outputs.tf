output "resource_group_name" {
  value       = data.azurerm_resource_group.rg.name
  description = "RG name"
}

output "vnet_name" {
  value       = module.network.vnet_id
  description = "Vnet ID"
}

output "load_balancer_ip" {
  value       = module.load_balancer.lb_ip
  description = "Public IP of LB"
}

output "load_balancer_url" {
  value       = "http://${module.load_balancer.lb_ip}"
  description = "URL for access"
}

output "vmss_name" {
  value       = module.vmss.vmss_name
  description = "Name of the virtual machine scale set"
}

output "db_fqdn" {
  value       = module.database.db_fqdn
  description = "FQDN of PostgreSQL"
  sensitive   = true
}

output "db_name" {
  value       = module.database.db_name
  description = "PostgreSQL name"
}

output "app_insights_instrumentation_key" {
  value       = module.monitoring.app_insights_instrumentation_key
  description = "Instrumentation key for Application Insights"
  sensitive   = true
}