output "key_vault_id_out" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.this.id
}