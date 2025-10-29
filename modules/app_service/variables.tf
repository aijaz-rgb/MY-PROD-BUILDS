variable "resource_group_name" {
  description = "Resource group for the app service"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "uaenorth"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "Name of the Web App"
  type        = string
}

variable "sku_name" {
  description = "SKU for App Service Plan"
  type        = string
  default     = "B1"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}

variable "allowed_public_ip" {
  description = "This is the only public ip allowed to connect to the site"
  type = string
}

variable "app_service_subnet_id" {
  description = "This subnet connects app service to the subnet where PE is connected"
  type = string
}
