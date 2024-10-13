local wezterm = require("wezterm")
local c = wezterm.config_builder()
local act = wezterm.action

c.window_decorations = "RESIZE"
c.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

c.warn_about_missing_glyphs = false

c.font_size = 13

-- c.send_composed_key_when_left_alt_is_pressed = true
c.hide_tab_bar_if_only_one_tab = true

c.front_end = "WebGpu"
c.max_fps = 240

c.keys = {
	{ key = "c", mods = "ALT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "ALT", action = act.PasteFrom("Clipboard") },
}

return c
