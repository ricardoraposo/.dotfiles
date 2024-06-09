-- vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
--
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "devicons")
-- dofile(vim.g.base46_cache .. "git")
-- dofile(vim.g.base46_cache .. "lsp")
-- dofile(vim.g.base46_cache .. "mason")
-- dofile(vim.g.base46_cache .. "nvimtree")
-- dofile(vim.g.base46_cache .. "syntax")
-- dofile(vim.g.base46_cache .. "treesitter")
-- dofile(vim.g.base46_cache .. "telescope")

require("huez").setup({
	path = vim.fs.normalize(vim.fn.stdpath("data") --[[@as string]]) .. "/huez",
	fallback = "default",
	suppress_messages = true,
	exclude = {
		"desert",
		"evening",
		"industry",
		"koehler",
		"morning",
		"murphy",
		"pablo",
		"peachpuff",
		"ron",
		"shine",
		"zellner",
		"blue",
		"darkblue",
		"delek",
		"quiet",
		"elflord",
		"habamax",
		"zaibatsu",
		"wildcharm",
		"vim",
	},
	picker = {
		themes = {
			layout = "center",
			opts = {},
		},
		favorites = {
			layout = "right",
			opts = {},
		},
		live = {
			layout = "right",
			opts = {},
		},
		ensured = {
			layout = "right",
			opts = {},
		},
	},
})
