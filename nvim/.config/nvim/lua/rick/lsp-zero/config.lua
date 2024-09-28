local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
local status3, mason_lsp = pcall(require, "mason-lspconfig")
if not status3 then
	return
end

local servers = {
	"lua_ls",
	"ts_ls",
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
	"ocamllsp",
}

local lspconfig = require("lspconfig")

mason.setup({})
mason_lsp.setup({
	ensure_installed = servers,
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({})
		end,

		eslint = function()
			lspconfig.eslint.setup({
				root_dir = lspconfig.util.root_pattern(".eslintrc", "package.json", "tsconfig.json", ".git"),
				settings = {
					workingDirectory = { mode = "auto" },
					nodePath = vim.fn.system("which node"):gsub("\n", ""), -- Make sure Node is used
				},
			})
		end,
	},
})
