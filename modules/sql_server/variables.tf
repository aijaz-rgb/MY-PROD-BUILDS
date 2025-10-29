variable "resource_group_name" {
  description = "Resource group for the app service"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "uaenorth"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}

variable "sql_server_name" {
  description = "Name for the SQL Server"
  type = string
}

variable "key_vault_id" {
  description = "The ID of the Azure Key Vault used to store the SQL Administrator password."
  type        = string
}

variable "value" {
  description = "The Actual SQL Administrator password."
  type        = string
}

/*
variable "sql_admin_group_object_id" {
    description = "Object ID (GUID) of the Azure AD Group for SQL Admin."
    type        = string
}*/