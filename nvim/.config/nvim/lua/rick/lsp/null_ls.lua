local null_ls = require("null-ls")

local diagnostics = null_ls.builtins.diagnostics
local formatter = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "mysql" },
		}),
		formatter.sqlfluff,
		formatter.stylua,
		formatter.goimports,
		formatter.jq,
		formatter.stylelint,
	},
})

-- require("conform").setup({
-- 	formatters_by_ft = {
-- 		lua = { "stylua" },
-- 		go = { "goimports" },
-- 		json = { "jq" },
-- 		css = { "styelint" },
-- 		sql = { "sql-formatter" },
-- 	},
-- })
--
-- require("lint").linters_by_ft = {
-- 	sql = { "sqlfluff" },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })
-- vim.keymap.set({ "n", "v" }, "<leader>f", function()
--   require("conform").format({
--     lsp_fallback = true,
--     async = false,
--     timeout_ms = 500,
--   })
-- end, opts
-- )
