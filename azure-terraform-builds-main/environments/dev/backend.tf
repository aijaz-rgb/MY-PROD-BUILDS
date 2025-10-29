# environments/dev/backend.tf


terraform {

  backend "azurerm" {
    # These values must be consistent across all environments
    resource_group_name  = "New_App_RG1-TERRA"  
    storage_account_name = "newst1terra1982" 
    container_name       = "containerterra"            
    
    # This value must be UNIQUE for this 'dev' environment
    key                  = "environments/dev/terraform.tfstate" 
  }

  
}