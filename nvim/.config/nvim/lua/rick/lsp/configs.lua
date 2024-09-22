local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status2, lspconfig = pcall(require, "lspconfig")
if not status2 then
	return
end

local status3, mason_lsp = pcall(require, "mason-lspconfig")
if not status3 then
	return
end

local capabilities = require("rick.lsp.handlers").capabilities
local on_attach = require("rick.lsp.handlers").on_attach
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"lua_ls",
	-- "ts_ls",
	"eslint",
	"html",
	"cssls",
	"jsonls",
	"emmet_ls",
	"tailwindcss",
	"prismals",
	"clangd",
	"gopls",
	"rust_analyzer",
	"dockerls",
	"docker_compose_language_service",
	"graphql",
	-- "ruff_lsp",
	"angularls",
	"volar",
	"elixirls",
	-- "ocamllsp",
}

mason.setup({})
mason_lsp.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	local has_custom_opts, server_custom_opts = pcall(require, "rick.lsp.settings." .. server)

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end

	lspconfig[server].setup(opts)
end

lspconfig.gleam.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
