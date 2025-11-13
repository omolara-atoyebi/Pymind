terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
        }
  }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name = "${var.rg_name}-${var.env}-ai-rg"
}
# terraform {
#     required_providers {
#         azurerm = {
#             source  = "hashicorp/azurerm"
#             version = ">= 3.0"
#         }
#         azapi = {
#             source  = "azure/azapi"
#             version = ">= 1.0"
#         }
#     }
#     required_version = ">= 1.1"
# }

# provider "azurerm" {
#     features {}
# }

# provider "azapi" {}



# ###locals {
#     name = "${var.prefix}-lang"
# }###

# resource "azurerm_resource_group" "rg" {
#     name     = "${var.prefix}-rg"
#     location = var.location
# }

# # Create an Azure Cognitive (Language) account using azapi to ensure exact ARM type
# resource "azapi_resource" "language_account" {
#     type               = "Microsoft.CognitiveServices/accounts@2022-12-01"
#     name               = local.name
#     location           = azurerm_resource_group.rg.location
#     resource_group     = azurerm_resource_group.rg.name

#     body = jsonencode({
#         kind = "Language"
#         sku  = { name = var.sku }
#         properties = {
#             publicNetworkAccess = "Enabled"
#         }
#         identity = {
#             type = "SystemAssigned"
#         }
#     })
# }

# # Call the listKeys action to retrieve account keys (API action)
# data "azapi_resource_action" "language_keys" {
#     resource_id = azapi_resource.language_account.id
#     action      = "listKeys"
#     api_version = "2022-12-01"
# }

