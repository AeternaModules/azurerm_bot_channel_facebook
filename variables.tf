variable "bot_channel_facebooks" {
  description = <<EOT
Map of bot_channel_facebooks, attributes below
Required:
    - bot_name
    - facebook_application_id
    - facebook_application_secret
    - facebook_application_secret_key_vault_id (alternative to facebook_application_secret - read from Key Vault instead)
    - facebook_application_secret_key_vault_secret_name (alternative to facebook_application_secret - read from Key Vault instead)
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
  # --- Unconfirmed validation candidates, derived from azurerm_bot_channel_facebook's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: bot_name
  #   source:    [from validate.BotName] !ok
  # path: bot_name
  #   condition: length(value) >= 4
  #   message:   [from validate.BotName: invalid when len(value) < 4]
  #   source:    [from validate.BotName: invalid when len(value) < 4]
  # path: bot_name
  #   condition: length(value) <= 42
  #   message:   [from validate.BotName: invalid when len(value) > 42]
  #   source:    [from validate.BotName: invalid when len(value) > 42]
  # path: bot_name
  #   source:    [from validate.BotName] !regexp.MustCompile(`^[a-zA-Z0-9][a-zA-Z0-9_-]*$`).MatchString(v)
  # path: facebook_application_id
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: facebook_application_secret
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: page.id
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: page.access_token
  #   condition: length(value) > 0
  #   message:   must not be empty
}

