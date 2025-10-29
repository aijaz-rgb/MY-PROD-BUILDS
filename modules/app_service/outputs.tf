# Output the App Service Plan ID
output "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_service_plan.this.id
}

# Output the App Service name
output "app_service_name" {
  description = "The name of the App Service"
  value       = azurerm_linux_web_app.this.name
}

# Output the App Service default hostname
output "app_service_default_hostname" {
  description = "The default hostname of the App Service"
  value       = azurerm_linux_web_app.this.default_hostname
}

# (Optional) Output the resource group for clarity
output "resource_group_name" {
  description = "The resource group where the App Service resides"
  value       = var.resource_group_name
}

