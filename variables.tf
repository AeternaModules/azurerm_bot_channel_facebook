variable "bot_channel_facebooks" {
  description = <<EOT
Map of bot_channel_facebooks, attributes below
Required:
    - bot_name
    - facebook_application_id
    - facebook_application_secret
    - facebook_application_secret_key_vault_id (optional, alternative to facebook_application_secret)
    - facebook_application_secret_key_vault_secret_name (optional, alternative to facebook_application_secret)
    - location
    - resource_group_name
    - page (block):
        - access_token (required)
        - id (required)
EOT

  type = map(object({
    bot_name                                          = string
    facebook_application_id                           = string
    facebook_application_secret                       = string
    facebook_application_secret_key_vault_id          = optional(string)
    facebook_application_secret_key_vault_secret_name = optional(string)
    location                                          = string
    resource_group_name                               = string
    page = list(object({
      access_token = string
      id           = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        length(v.page) >= 1
      )
    ])
    error_message = "Each page list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        length(v.bot_name) >= 4
      )
    ])
    error_message = "[from validate.BotName: invalid when len(value) < 4]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        length(v.bot_name) <= 42
      )
    ])
    error_message = "[from validate.BotName: invalid when len(value) > 42]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        length(v.facebook_application_id) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        length(v.facebook_application_secret) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        alltrue([for item in v.page : (length(item.id) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_facebooks : (
        alltrue([for item in v.page : (length(item.access_token) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

