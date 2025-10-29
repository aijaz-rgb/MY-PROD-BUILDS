variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Key Vault will be created."
  type        = string
}

variable "location" {
  description = "The Azure region for the Key Vault."
  type        = string
}
/*
variable "tenant_id" {
  description = "The Azure Tenant ID."
  type        = string
}

variable "caller_object_id" {
  description = "The Object ID of the identity running Terraform (for access policy)."
  type        = string
}
*/