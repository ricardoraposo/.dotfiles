-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"
config.colors = { background = "#1c2433" }

config.window_decorations = "RESIZE"
config.window_padding = {
	left = 1,
	right = 0,
	top = 2,
	bottom = 0,
}

-- config.font = wezterm.font("MonoLisa")
config.font_size = 17.0
config.line_height = 1.0

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
