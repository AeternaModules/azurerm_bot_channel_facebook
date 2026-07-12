data "azurerm_key_vault_secret" "facebook_application_secret" {
  for_each     = { for k, v in var.bot_channel_facebooks : k => v if v.facebook_application_secret_key_vault_id != null && v.facebook_application_secret_key_vault_secret_name != null }
  name         = each.value.facebook_application_secret_key_vault_secret_name
  key_vault_id = each.value.facebook_application_secret_key_vault_id
}
resource "azurerm_bot_channel_facebook" "bot_channel_facebooks" {
  for_each = var.bot_channel_facebooks

  bot_name                    = each.value.bot_name
  facebook_application_id     = each.value.facebook_application_id
  facebook_application_secret = each.value.facebook_application_secret != null ? each.value.facebook_application_secret : try(data.azurerm_key_vault_secret.facebook_application_secret[each.key].value, null)
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name

  dynamic "page" {
    for_each = each.value.page
    content {
      access_token = page.value.access_token
      id           = page.value.id
    }
  }
}

