output "sql_server_id_out" {
description = "The ID of the Azure SQL"
value = azurerm_mssql_server.this.id
}

output "sql_admin_password_out" {
description = "The generated password for the SQL server administrator"
value = random_password.sql_admin_password.result
sensitive = true
}



