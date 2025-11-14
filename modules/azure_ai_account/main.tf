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
    } 
    identity = {
    type = "SystemAssigned"
  }
  } 
}


data "azapi_resource_action" "language_keys" {
    type        = "Microsoft.CognitiveServices/accounts@2022-10-01/listKeys"
    method     = "GET"
    resource_id = azapi_resource.ai_account.id
    
    
}

