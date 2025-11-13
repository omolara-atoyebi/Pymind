output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

# output "language_account_name" {
#     value = azapi_resource.language_account.name
# }

# # Typical Cognitive Services endpoint pattern; adjust if your region/sku differs
# output "endpoint" {
#     value = "https://${azapi_resource.language_account.name}.cognitiveservices.azure.com"
# }

# # Primary and secondary keys returned by the listKeys action
# output "primary_key" {
#     value = try(jsondecode(data.azapi_resource_action.language_keys.response_body).key1, "")
#     sensitive = true
# }

# output "secondary_key" {
#     value = try(jsondecode(data.azapi_resource_action.language_keys.response_body).key2, "")
#     sensitive = true
# }