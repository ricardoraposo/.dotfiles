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

require("Navigator").setup()

require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

require("blame").setup()

require("virt-column").setup()

require("trouble").setup({})

require("barbecue").setup({
  symbols = {
    separator = "↠",
  },
})
