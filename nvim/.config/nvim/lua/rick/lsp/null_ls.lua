local null_ls = require("null-ls")

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "mysql" },
		}),
	},
})

local opts = { noremap = true, silent = true }
local conform = require("conform")

conform.formatters.sqlfluff = {
	args = { "fix", "--force", "--dialect=mysql", "-" },
}

conform.setup({
	formatters_by_ft = {
		sql = { "sqlfluff" },
		lua = { "stylua" },
		go = { "goimports" },
		json = { "jq" },
		css = { "stylelint" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, opts)
