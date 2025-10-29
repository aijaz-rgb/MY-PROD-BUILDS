variable "vnet_name" {
    description = "Name of the Virtual Network"
    type        = string
}

variable "vnet_address_space" {
    description = "Vnet Address Space"
    type        = string
}


variable "subnet_name" {
    description = "Name of Subnet"
    type        = string

   }

variable "dns_servers" {
    description = "The DNS servers"
    type        = string
  
}

variable "vnet_tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}

variable "location" {
    description = "Location of vnet"
    type        = string

  
}

variable "resource_group_name" {

    description = "Name of the Resource Group"
    type        = string


}

variable "subnet_address_prefix1" {
    description = "Subnet 1 address prefix"
    type = string
}