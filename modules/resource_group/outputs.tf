output "resource_group_name_out"{
    description = "The name of the resource Group"
    value       = azurerm_resource_group.this.name
}

output "resource_group_location_out" {
    description = "Azure Location Where the RG is located"
    value       = azurerm_resource_group.this.location


}
