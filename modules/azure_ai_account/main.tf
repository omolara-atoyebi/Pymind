terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
        }
    azapi = {
      source  = "azure/azapi"
      version = ">= 1.0"
    }
  }
}

provider "azurerm" {
    features {}
}

provider "azapi" {}

resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name = "${var.rg_name}-${var.env}-ai-rg"
}

resource "azurerm_search_service" "ai_search" {
  name                = "${var.rg_name}-${var.env}-ai-search"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "standard"
  partition_count    = 1
  replica_count      = 1
  
}

resource "azapi_resource" "ai_account" {
  type       = "Microsoft.CognitiveServices/accounts@2022-10-01"
  name       = "${var.rg_name}-${var.env}-ai-account"
  location   = azurerm_resource_group.rg.location
  parent_id  = azurerm_resource_group.rg.id
  body ={
    kind = "TextAnalytics"
    sku  = {  
      name = var.sku
    }
    properties = {
      publicNetworkAccess = "Enabled"
      
      linkedSearchResources = [
        {
          id = azurerm_search_service.ai_search.id
        }
      ]
    } 
    identity = {
    type = "SystemAssigned"
  }
  } 
  schema_validation_enabled = false
  response_export_values    = ["*"]
}


data "azapi_resource_action" "language_keys" {
    type        = "Microsoft.CognitiveServices/accounts@2022-10-01"
    #method     = "GET"
    resource_id = azapi_resource.ai_account.id
    action    = "listKeys"
    response_export_values = ["*"]
    
    
}

