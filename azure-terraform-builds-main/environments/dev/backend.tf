# environments/dev/backend.tf


terraform {

  backend "azurerm" {
    # These values must be consistent across all environments
    resource_group_name  = "gen-ai-rg"  
    storage_account_name = "genaistorageterra" 
    container_name       = "statefilecontainer"            
    
    # This value must be UNIQUE for this 'dev' environment
    key                  = "environments/dev/terraform.tfstate" 
  }

  
}
