output "bot_channel_facebooks" {
  description = "All bot_channel_facebook resources"
  value       = azurerm_bot_channel_facebook.bot_channel_facebooks
  sensitive   = true
}
output "bot_channel_facebooks_bot_name" {
  description = "List of bot_name values across all bot_channel_facebooks"
  value       = [for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : v.bot_name]
}
output "bot_channel_facebooks_facebook_application_id" {
  description = "List of facebook_application_id values across all bot_channel_facebooks"
  value       = [for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : v.facebook_application_id]
}
output "bot_channel_facebooks_facebook_application_secret" {
  description = "List of facebook_application_secret values across all bot_channel_facebooks"
  value       = [for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : v.facebook_application_secret]
  sensitive   = true
}
output "bot_channel_facebooks_location" {
  description = "List of location values across all bot_channel_facebooks"
  value       = [for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : v.location]
}
output "bot_channel_facebooks_page" {
  description = "List of page values across all bot_channel_facebooks"
  value       = [for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : v.page]
  sensitive   = true
}
output "bot_channel_facebooks_resource_group_name" {
  description = "List of resource_group_name values across all bot_channel_facebooks"
  value       = [for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : v.resource_group_name]
}

