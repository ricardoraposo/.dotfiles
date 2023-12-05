vim.cmd.colorscheme("nord")
require("transparent").setup({
	extra_groups = {
		"NormalFloat",
		"NvimTreeNormal",
		"NvimTreeEndOfBuffer",
	},
})
vim.cmd("TransparentEnable")
