local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")
local capabilities = require("rick.lsp.handlers").capabilities
local on_attach = require("rick.lsp.handlers").on_attach
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { "jsonls", "sumneko_lua", "tsserver", "cssls", "html", "bashls", "gopls", "prismals", "ccls"}

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "rick.lsp.settings." .. server)

	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "html", "css", "sass", "scss", "less" },
		-- filetypes = { "html", "javascriptreact", "typescriptreact", "css", "sass", "scss", "less" },
	})

	lspconfig.tailwindcss.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
	})

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end

	lspconfig[server].setup(opts)
end
