output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "cognitive_account_name" {
    value = azapi_resource.ai_account.name    
  
}
output "ai_endpoint" {
  value = "https://${azapi_resource.ai_account.name}.cognitiveservices.azure.com"
}

output "ai_account_id" {
  value = azapi_resource.ai_account.id
}

output "search_id" {
  value = azurerm_search_service.ai_search.id
}

output "ai_primary_key" {
  value = try(jsondecode(data.azapi_resource_action.language_keys.output).key1, "")
}
output "ai_secondary_key" {
  value = try(jsondecode(data.azapi_resource_action.language_keys.output).key2, "")
}


# Primary and secondary keys returned by the listKeys action
# output "primary_key" {
#     value = try(jsondecode(data.azapi_resource_action.language_keys.response_body).key1, "")
#     sensitive = true
# }

# output "secondary_key" {
#     value = try(jsondecode(data.azapi_resource_action.language_keys.response_body).key2, "")
#     sensitive = true
# }