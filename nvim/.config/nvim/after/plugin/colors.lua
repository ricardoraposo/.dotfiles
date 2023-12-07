vim.cmd.colorscheme("gruvbox-minor")
require("transparent").setup({
	extra_groups = {
		"NormalFloat",
		"NvimTreeNormal",
		"NvimTreeEndOfBuffer",
	},
})
vim.cmd("TransparentEnable")
