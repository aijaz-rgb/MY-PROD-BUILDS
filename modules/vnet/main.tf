resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_space]
  dns_servers         = [var.dns_servers]


  

    tags =  var.vnet_tags    
    
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet_name 
    # This relies on the VNet resource name ('this')
  virtual_network_name = azurerm_virtual_network.this.name 
  resource_group_name  = var.resource_group_name  
  address_prefixes     = [var.subnet_address_prefix1] 
  
  # Optional: Explicitly ensure creation order
  depends_on           = [azurerm_virtual_network.this]
}