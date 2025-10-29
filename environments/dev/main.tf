terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.50.0"
    }
  }
}

/*
data "azuread_group" "sql_admins_group" {
  display_name = "SQL_Admins"
}*/

provider "azurerm" {
  features {}
  
  
}

module "resource_group" {
source  =   "../../modules/resource_group"
name    =   "rg-genaisearch-dev-uaenorth-001"
location=   "uaenorth"

tags = {
    Environment     = "Dev"
    ManagedBy       = "Terraform"
  }

}


module "app_service" {
  
  
  source = "../../modules/app_service"

  resource_group_name   = module.resource_group.resource_group_name_out
  location              = module.resource_group.resource_group_location_out
  app_service_plan_name = "plan-genaisearch-dev-uaenorth-001"
  sku_name              = "B1"
  app_service_name      = "app-genaisearch-deva-uaenorth-001"
  allowed_public_ip     = "194.170.173.3/32"
  app_service_subnet_id = module.vnet.subnet_id_out

  tags = {
    Environment         = "Dev"
    ManagedBy           = "Terraform"
  } 
}



module "sql_server" {
source = "../../modules/sql_server"
sql_server_name  =  "sql-genaisearch-dev-uaenorth-001"
resource_group_name = module.resource_group.resource_group_name_out
location = module.resource_group.resource_group_location_out
key_vault_id = module.key_vault.key_vault_id_out
value = module.sql_server.sql_admin_password_out
#sql_admin_group_object_id = data.azuread_group.sql_admins_group.object_id


 tags = {
    Environment         = "Dev"
    ManagedBy           = "Terraform"
  } 

}


module "vnet" {
source = "../../modules/vnet"
vnet_name = "vnet-genaisearch-dev-uaenorth-001"
vnet_address_space = "10.228.3.0/24"
subnet_name = "snet-genaisearch-dev-uaenorth-001"
subnet_address_prefix1 = "10.228.3.0/24"
resource_group_name = module.resource_group.resource_group_name_out
location = module.resource_group.resource_group_location_out
dns_servers = "168.63.129.16"
vnet_tags = {
  Environment = "Dev"
  ManagedBy   = "Terraform"
}

}

resource "azurerm_private_endpoint" "sql_pe" {
  name = "pe-genaisearch-sql-dev-uaenorth-001"
  location = module.resource_group.resource_group_location_out
  resource_group_name = module.resource_group.resource_group_name_out
  subnet_id = module.vnet.subnet_id_out

  tags = { 
    Environment = "Dev"
    ManagedBy = "Terraform"
     }
  private_service_connection {
    name = "sql-connection"
    is_manual_connection = false
    private_connection_resource_id = module.sql_server.sql_server_id_out
    subresource_names = ["sqlserver"]
   
    }

    private_dns_zone_group {
    name                 = "default" # Name is required, "default" is common
    private_dns_zone_ids = [azurerm_private_dns_zone.sql_zone.id]
  }


}

resource "azurerm_private_dns_zone" "sql_zone" {
  name = "priavatelink.database.windows.net"
  resource_group_name = module.resource_group.resource_group_name_out

}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_vnet_link" {
  name = "sql_vnet_link"
  resource_group_name = module.resource_group.resource_group_name_out
  private_dns_zone_name = azurerm_private_dns_zone.sql_zone.name
  virtual_network_id = module.vnet.vnet_id_out
    
}

#resource "azurerm_private_endpoint_dns_zone_group" "sql_dns_group" {
 # name = "default"
  #private_endpoint_id = azurerm_private_endpoint.sql_pe.id
  #private_dns_zone_ids  = [azurerm_private_dns_zone.sql_zone.id]
  
#}



module "key_vault" {
  source = "../../modules/key_vault"
  key_vault_name           = "kvgenaisrchdev01"
  location                    = module.resource_group.resource_group_location_out
  resource_group_name         = module.resource_group.resource_group_name_out
  

  }
