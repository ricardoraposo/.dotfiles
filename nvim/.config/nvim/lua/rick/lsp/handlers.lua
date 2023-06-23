local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- enables virtual text
    virtual_text = true,
    -- show signs
    signs = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>Lspsaga code_action<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lsf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lsi", "<cmd>Lspsaga incoming_calls<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lso", "<cmd>Lspsaga outgoing_calls<CR>", opts)
end

M.on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.semanticTokensProvider = nil
  lsp_keymaps(bufnr)
  -- if client.name == "omnisharp" then
  --   client.server_capabilities.semanticTokensProvider = {
  --     full = vim.empty_dict(),
  --     legend = {
  --       tokenModifiers = { "static_symbol" },
  --       tokenTypes = {
  --         "comment",
  --         "excluded_code",
  --         "identifier",
  --         "keyword",
  --         "keyword_control",
  --         "number",
  --         "operator",
  --         "operator_overloaded",
  --         "preprocessor_keyword",
  --         "string",
  --         "whitespace",
  --         "text",
  --         "static_symbol",
  --         "preprocessor_text",
  --         "punctuation",
  --         "string_verbatim",
  --         "string_escape_character",
  --         "class_name",
  --         "delegate_name",
  --         "enum_name",
  --         "interface_name",
  --         "module_name",
  --         "struct_name",
  --         "type_parameter_name",
  --         "field_name",
  --         "enum_member_name",
  --         "constant_name",
  --         "local_name",
  --         "parameter_name",
  --         "method_name",
  --         "extension_method_name",
  --         "property_name",
  --         "event_name",
  --         "namespace_name",
  --         "label_name",
  --         "xml_doc_comment_attribute_name",
  --         "xml_doc_comment_attribute_quotes",
  --         "xml_doc_comment_attribute_value",
  --         "xml_doc_comment_cdata_section",
  --         "xml_doc_comment_comment",
  --         "xml_doc_comment_delimiter",
  --         "xml_doc_comment_entity_reference",
  --         "xml_doc_comment_name",
  --         "xml_doc_comment_processing_instruction",
  --         "xml_doc_comment_text",
  --         "xml_literal_attribute_name",
  --         "xml_literal_attribute_quotes",
  --         "xml_literal_attribute_value",
  --         "xml_literal_cdata_section",
  --         "xml_literal_comment",
  --         "xml_literal_delimiter",
  --         "xml_literal_embedded_expression",
  --         "xml_literal_entity_reference",
  --         "xml_literal_name",
  --         "xml_literal_processing_instruction",
  --         "xml_literal_text",
  --         "regex_comment",
  --         "regex_character_class",
  --         "regex_anchor",
  --         "regex_quantifier",
  --         "regex_grouping",
  --         "regex_alternation",
  --         "regex_text",
  --         "regex_self_escaped_character",
  --         "regex_other_escape",
  --       },
  --     },
  --     range = true,
  --   }
  -- end
end


local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
