local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.term = "wezterm"

config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font 'Dank Mono'
config.font_size = 12.0
config.line_height = 1.1

config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.audible_bell = "Disabled"

config.keys = {
  {key = 'c', mods = 'ALT', action = wezterm.action.CopyTo "Clipboard"},
  {key = 'v', mods = 'ALT', action = wezterm.action.PasteFrom "Clipboard"},
  {key = '=', mods = 'CTRL', action = wezterm.action.ResetFontSize},
  {key = '=', mods = 'ALT', action = wezterm.action.IncreaseFontSize},
  {key = '-', mods = 'ALT', action = wezterm.action.DecreaseFontSize},
}

return config
