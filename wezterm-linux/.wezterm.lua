local wezterm = require("wezterm")
local c = wezterm.config_builder()
local act = wezterm.action

local function isViProcess(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(act.SendKey({ key = vim_direction, mods = "ALT" }), pane)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

wezterm.on("update-right-status", function(window)
	local date = wezterm.strftime("⏱️ %H:%M ")

	local bat = ""
	for _, b in ipairs(wezterm.battery_info()) do
		bat = "🔋" .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	-- Make it italic and underlined
	window:set_right_status(wezterm.format({ { Text = bat .. "  " .. date } }))
end)

-- This is where you actually apply your config choices
c.window_decorations = "RESIZE"
c.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

c.font = wezterm.font("Comic Code Ligatures")
c.line_height = 1.4
c.freetype_load_flags = "NO_HINTING"
c.warn_about_missing_glyphs = false

c.send_composed_key_when_left_alt_is_pressed = true
-- c.hide_tab_bar_if_only_one_tab = true

c.use_fancy_tab_bar = false
-- c.front_end = "WebGpu"

c.keys = {
	{ key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
	{ key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
	{ key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
	{ key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },
	{ key = "y", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "k", mods = "ALT", action = act.ActivateTabRelative(1) },
	{ key = "j", mods = "ALT", action = act.ActivateTabRelative(-1) },
	{ key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "c", mods = "ALT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "ALT", action = act.PasteFrom("Clipboard") },
	{ key = "RightArrow", mods = "ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "LeftArrow", mods = "ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "UpArrow", mods = "ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "w", mods = "ALT", action = act.CloseCurrentPane({ confirm = true }) },
}

c.max_fps = 240

return c
