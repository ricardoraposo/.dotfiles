local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("rick.lsp.configs")
require("rick.lsp.null-ls")
require("rick.lsp.handlers").setup()
