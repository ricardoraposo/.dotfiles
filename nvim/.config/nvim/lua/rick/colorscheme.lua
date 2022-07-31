local status_ok, color = pcall(require, "doom-one")
if not status_ok then
	return
end

color.setup({
	cursor_coloring = false,
	terminal_color = true,
	enable_treesitter = true,
	italic_comments = true,
	transparent_background = true,
	pumblend = {
		enable = false,
		transparency_amount = 100,
	},
	plugins_integrations = {
		gitsigns = true,
		telescope = true,
		neogit = true,
		nvim_tree = true,
	},
})

-- color.setup({
--   style = "deep",
--   transparent = true,
--   code_style = {
--     comments = "none",
--   },
-- })
--
-- color.load()

vim.api.nvim_set_hl(0, "lineNr", {
	fg = "#41a7fc",
})
