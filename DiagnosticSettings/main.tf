




resource "azurerm_monitor_diagnostic_setting" "diagnos" {
  name               = var.resource_diagnosticsetting_frontendapp
  target_resource_id = var.target_resource_id_frontend
  storage_account_id = var.storage_account_id

  log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }

  }
  log {
    category = "AppServicePlatformLogs"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diagnos1" {
  name               = var.resource_diagnosticsetting_backendapp
  target_resource_id = var.target_resource_id_backend
  storage_account_id = var.storage_account_id

  log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }

  }
  log {
    category = "AppServicePlatformLogs"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
