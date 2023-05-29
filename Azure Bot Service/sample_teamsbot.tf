resource "azurerm_bot_channels_registration" "example" {
  name                = "example-bcr"
  location            = "global"
  resource_group_name = "resourcegroup"
  sku                 = "F0"
  microsoft_app_id    = data.azurerm_client_config.current.client_id
}

resource "azurerm_bot_channel_line" "example" {
  bot_name            = "example-bcr"
  location            = "global"
  resource_group_name = "resourcegroup"

  line_channel {
    access_token = "asdfdsdfTYUIOIoj1231hkjhk"
    secret       = "aagfdgfd123567"
  }
}
resource "azurerm_bot_channel_ms_teams" "example" {
 bot_name            = "example-bcr"
  location            = "global"
  resource_group_name = "resourcegroup"
}