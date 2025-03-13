output "app_insights_instrumentation_key" {
  value = azurerm_application_insights.app_insights.instrumentation_key
  sensitive = true
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.workspace.id
}