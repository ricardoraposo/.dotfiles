return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
    require("conform").setup {
    notify_on_error = false,
    format_on_save = nil,
    formatters = {
      prettier = {
        require_cwd = true,
      },
      biome = {
        require_cwd = true,
      },
      biome_check = {
        require_cwd = true,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'biome', 'prettier', stop_after_first = true },
      typescript = { 'biome-check', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettier', stop_after_first = true },
      javascriptreact = { 'prettier', stop_after_first = true },
    },
  }
  end
}
