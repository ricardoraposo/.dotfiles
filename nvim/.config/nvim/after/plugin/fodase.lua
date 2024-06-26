vim.opt.termguicolors = true
require("dressing").setup({
	select = {
		backend = { "fzf", "builtin", "nui" },
	},
})

require("rest-nvim").setup({
	skip_ssl_verification = false,
	encode_url = true,
	highlight = {
		enable = true,
		timeout = 150,
	},
	result = {
		split = {
			horizontal = true,
			in_place = false,
		},
		behavior = {
			decode_url = true,
			show_info = {
				url = true,
				headers = true,
				http_info = true,
				curl_command = true,
			},
			formatters = {
				json = "jq",
				html = function(body)
					return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
				end,
			},
		},
	},
	env_file = ".env",
	custom_dynamic_variables = {},
})

require("colorizer").setup()

require("fidget").setup({
	text = {
		spinner = "dots_negative",
	},
	align = {
		bottom = true,
	},
	window = {
		relative = "editor",
	},
})

-- require("ibl").setup({
-- 	scope = { enabled = false },
-- })

require("ts-error-translator").setup()

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

require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
