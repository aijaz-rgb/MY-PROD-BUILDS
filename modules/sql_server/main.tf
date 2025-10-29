resource "random_password" "sql_admin_password" {
  length = 20
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}



resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = random_password.sql_admin_password.result
    minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "SQL_Admins"
    object_id      = "e31aa022-51ae-49d3-a3cb-cf6e2df737cc"
  }
  tags = var.tags
  }

resource "azurerm_key_vault_secret" "sql_admin_secret" {
name  = "SQLAdminPassword"
key_vault_id  = var.key_vault_id
value = var.value

}

