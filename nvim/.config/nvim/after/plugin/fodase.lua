vim.opt.termguicolors = true
require("dressing").setup({
  select = {
    backend = { "fzf", "builtin", "nui" },
  }
})

require("rest-nvim").setup({
	result_split_horizontal = true,
	result_split_in_place = false,
	skip_ssl_verification = false,
	encode_url = true,
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		show_url = true,
		show_curl_command = false,
		show_http_info = true,
		show_headers = true,
		formatters = {
			json = "jq",
			html = function(body)
				return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
			end,
		},
	},
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
})

-- require("ibl").setup({
-- 	scope = {
-- 		enabled = false,
-- 	},
-- })

require("colorizer").setup()
require("flash").setup({})

local nvim_tmux_nav = require("nvim-tmux-navigation")
nvim_tmux_nav.setup({
	disable_when_zoomed = true, -- defaults to false
})

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
