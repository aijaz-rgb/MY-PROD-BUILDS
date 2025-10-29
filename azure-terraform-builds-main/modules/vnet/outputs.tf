output "subnet_id_out" {
description = "The ID of the main application subnet"
value = azurerm_subnet.subnet1.id

}

output "vnet_id_out" {
  description = "The ID of the Virtual Network."
  # This returns the ID of the VNet resource
  value       = azurerm_virtual_network.this.id
}

