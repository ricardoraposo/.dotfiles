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
