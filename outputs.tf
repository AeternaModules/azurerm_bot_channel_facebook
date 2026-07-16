output "bot_channel_facebooks_id" {
  description = "Map of id values across all bot_channel_facebooks, keyed the same as var.bot_channel_facebooks"
  value       = { for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bot_channel_facebooks_bot_name" {
  description = "Map of bot_name values across all bot_channel_facebooks, keyed the same as var.bot_channel_facebooks"
  value       = { for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : k => v.bot_name if v.bot_name != null && length(v.bot_name) > 0 }
}
output "bot_channel_facebooks_facebook_application_id" {
  description = "Map of facebook_application_id values across all bot_channel_facebooks, keyed the same as var.bot_channel_facebooks"
  value       = { for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : k => v.facebook_application_id if v.facebook_application_id != null && length(v.facebook_application_id) > 0 }
}
output "bot_channel_facebooks_facebook_application_secret" {
  description = "Map of facebook_application_secret values across all bot_channel_facebooks, keyed the same as var.bot_channel_facebooks"
  value       = { for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : k => v.facebook_application_secret if v.facebook_application_secret != null && length(v.facebook_application_secret) > 0 }
  sensitive   = true
}
output "bot_channel_facebooks_location" {
  description = "Map of location values across all bot_channel_facebooks, keyed the same as var.bot_channel_facebooks"
  value       = { for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : k => v.location if v.location != null && length(v.location) > 0 }
}
output "bot_channel_facebooks_page" {
  description = "Map of page values across all bot_channel_facebooks, keyed the same as var.bot_channel_facebooks"
  value       = { for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : k => v.page if v.page != null && length(v.page) > 0 }
  sensitive   = true
}
output "bot_channel_facebooks_resource_group_name" {
  description = "Map of resource_group_name values across all bot_channel_facebooks, keyed the same as var.bot_channel_facebooks"
  value       = { for k, v in azurerm_bot_channel_facebook.bot_channel_facebooks : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}

