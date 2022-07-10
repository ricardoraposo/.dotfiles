local function getTime()
	local date = os.date("*t")
	return ("%02d:%02d"):format(((date.hour % 24) - 1) % 12 + 1, date.min)
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = " " },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { {
			"filetype",
			colored = true,
			icon_only = true,
		}, "encoding" },
		lualine_y = {},
		lualine_z = { getTime },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
