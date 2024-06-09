local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 1,
	right = 0,
	top = 2,
	bottom = 0,
}

config.font = wezterm.font("Menlo")
config.font_size = 15.0

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
