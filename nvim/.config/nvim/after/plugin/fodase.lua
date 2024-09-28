vim.opt.termguicolors = true

require("dressing").setup({
	select = {
		backend = { "fzf", "builtin", "nui" },
	},
})

require("colorizer").setup()

require("blame").setup()

