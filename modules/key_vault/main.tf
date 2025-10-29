data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name                    = "standard"
  tenant_id                   = data.azurerm_client_config.current.tenant_id  # <--- Use the module input variable
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id # <--- Use the module input variable
    object_id          = data.azurerm_client_config.current.object_id
    secret_permissions = ["Set", "Get", "Delete", "List", "Purge", "Recover"]
  }
}