local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.jq,
		-- formatting.stylua,
		formatting.prettier.with({
			extra_args = {
				"--single-quote",
				"--jsx-single-quote",
			},
		}),
		diagnostics.stylelint.with({
			only_local = "node_modules/.bin",
		}),
		diagnostics.eslint.with({
			only_local = "node_modules/.bin",
			diagnostic_config = {
				virtual_text = false,
			},
		}),
		diagnostics.shellcheck,
		formatting.goimports,
		formatting.jq,
	},
})
