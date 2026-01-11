resource "azurerm_bot_channel_facebook" "bot_channel_facebooks" {
  for_each = var.bot_channel_facebooks

  bot_name                    = each.value.bot_name
  facebook_application_id     = each.value.facebook_application_id
  facebook_application_secret = each.value.facebook_application_secret
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name

  page {
    access_token = each.value.page.access_token
    id           = each.value.page.id
  }
}

