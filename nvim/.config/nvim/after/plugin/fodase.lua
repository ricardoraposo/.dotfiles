vim.opt.list = true

require("indent_blankline").setup({
	show_current_context = true,
})

local wilder = require("wilder")
wilder.setup({
	modes = { ":", "/", "?" },
	next_key = "<C-n>",
	previous_key = "<C-p>",
})

wilder.set_option(
	"renderer",
	wilder.wildmenu_renderer({
		highlighter = wilder.basic_highlighter(),
		apply_incsearch_fix = true,
	})
)

-- This isn't dumb but it was getting on the way of my stuff on telescope
require("jaq-nvim").setup({
	cmds = {
		internal = {
			lua = "luafile %",
			vim = "source %",
		},
		external = {
			javascript = "node %",
			markdown = "glow %",
			python = "python3 %",
			go = "go run %",
			cs = "dotnet run",
			sh = "sh %",
			hurl = "hurl %",
		},
	},
	behavior = {
		default = "terminal",
		startinsert = false,
		autosave = false,
	},
	ui = {
		terminal = {
			position = "vsplit",
			size = 3,
			line_no = false,
		},
	},
})

require("rest-nvim").setup({
  result_split_horizontal = false,
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
        return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
      end
    },
  },
  jump_to_request = false,
  env_file = '.env',
  custom_dynamic_variables = {},
  yank_dry_run = true,
})
