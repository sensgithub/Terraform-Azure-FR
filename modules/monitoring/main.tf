resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "${var.project_name}-${var.environment}-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_application_insights" "app_insights" {
  name                = "${var.project_name}-${var.environment}-appinsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = azurerm_log_analytics_workspace.workspace.id
  application_type    = "web"
  tags                = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "vmss_diag" {
  name                       = "${var.project_name}-${var.environment}-vmss-diag"
  target_resource_id         = var.vmss_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

resource "azurerm_monitor_diagnostic_setting" "lb_diag" {
  name                       = "${var.project_name}-${var.environment}-lb-diag"
  target_resource_id         = var.lb_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

resource "azurerm_monitor_diagnostic_setting" "db_diag" {
  name                       = "${var.project_name}-${var.environment}-db-diag"
  target_resource_id         = var.db_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

resource "azurerm_monitor_action_group" "critical_alerts" {
  name                = "${var.project_name}-${var.environment}-critical-alerts"
  resource_group_name = var.resource_group_name
  short_name          = "critical"

  email_receiver {
    name          = "${var.email_name}"
    email_address = "${var.email_address}"
  }
}

resource "azurerm_monitor_metric_alert" "high_cpu_alert" {
  name                = "${var.project_name}-${var.environment}-high-cpu"
  resource_group_name = var.resource_group_name
  scopes              = [var.vmss_id]
  description         = "Alert when CPU usage exceeds 80% for 5 minutes"
  severity            = 2

  criteria { 
    # metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_namespace = "Microsoft.Compute/virtualMachineScaleSets"
    metric_name      = "Percentage CPU"
    # aggregation      = "Total"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
  action_group_id  = azurerm_monitor_action_group.critical_alerts.id
  }
}