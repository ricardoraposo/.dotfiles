local configs = require("nvim-treesitter.configs")

local disabledExtensions =
	{ "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "go", "c_sharp", "lua", "c", "cpp" }

configs.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "phpdoc", "bash" }, -- List of parsers to ignore installing
	highlight = {
		enable = false, -- false will disable the whole extension
		disable = disabledExtensions, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml", "html" } },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<C-w>",
		chars = { "{", "[", "(", '"', "'", "<" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

require("nvim_comment").setup({
	marker_padding = true,
	comment_empty = true,
	comment_empty_trim_whitespace = false,
	create_mappings = true,
	line_mapping = "gcc",
	operator_mapping = "gc",
	comment_chunk_text_object = "ic",
	hook = nil,
})

require("nvim_comment").setup({
	hook = function()
		require("ts_context_commentstring.internal").update_commentstring()
	end,
})
