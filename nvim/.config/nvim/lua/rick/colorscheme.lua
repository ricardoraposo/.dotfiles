require("onedark").setup({
	style = "deep",
	transparent = true,
	code_style = {
		comments = "none",
	},
})

require("onedark").load()

vim.api.nvim_set_hl(0, "lineNr", {
	fg = "#41a7fc",
})

vim.api.nvim_set_hl(0, "netrwDir", {
	fg = "#41a7fc",
})
