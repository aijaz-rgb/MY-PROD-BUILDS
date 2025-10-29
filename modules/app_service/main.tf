
resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name
  os_type             = "Linux"
  tags                = var.tags
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.this.id
  tags                = var.tags
  virtual_network_subnet_id=var.app_service_subnet_id

  site_config {
    always_on = true
    ip_restriction {
      name = "AllowSpecificIP"
      priority = 100
      ip_address = var.allowed_public_ip
      action = "Allow"

    }
    ip_restriction {
      name = "DenyAllOtherPublicIPs"
      priority = 200
      ip_address = "0.0.0.0/0"
      action = "Deny"
    }

    
    application_stack {
      dotnet_version = "8.0"
    }
  }
}
