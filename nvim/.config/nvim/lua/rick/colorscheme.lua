-- Add color to cursor
vim.g.doom_one_cursor_coloring = false
-- Set :terminal colors
vim.g.doom_one_terminal_colors = true
-- Enable italic comments
vim.g.doom_one_italic_comments = false
-- Enable TS support
vim.g.doom_one_enable_treesitter = true
-- Color whole diagnostic text or only underline
vim.g.doom_one_diagnostics_text_color = false
-- Enable transparent background
vim.g.doom_one_transparent_background = false

-- Plugins integration
vim.g.doom_one_plugin_telescope = false
vim.g.doom_one_plugin_neogit = true
vim.g.doom_one_plugin_nvim_tree = true

-- vim.cmd("colorscheme doom-one")

vim.g.neobones_transparent_background = true
vim.cmd("colorscheme neobones")

vim.api.nvim_set_hl(0, "lineNr", {
	fg = "#41a7fc",
})

vim.api.nvim_set_hl(0, "FloatermBorder", {
	bg = "none",
	fg = "#41a7fc",
})

vim.api.nvim_set_hl(0, "Floaterm", {
	bg = "none",
})
