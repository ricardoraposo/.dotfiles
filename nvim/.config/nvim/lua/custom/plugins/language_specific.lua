return {
  { 'yioneko/nvim-vtsls' },
  {
    'dmmulroy/tsc.nvim',
    opts = {},
  },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  -- {
  --   'elixir-tools/elixir-tools.nvim',
  --   version = '*',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   config = function()
  --     local elixir = require 'elixir'
  --     local elixirls = require 'elixir.elixirls'
  --
  --     elixir.setup {
  --       elixirls = {
  --         enable = true,
  --         settings = elixirls.settings {
  --           dialyzerEnabled = true,
  --           enableTestLenses = true,
  --         },
  --         on_attach = function()
  --           vim.keymap.set('n', '<space>fp', ':ElixirFromPipe<cr>', { buffer = true, noremap = true })
  --           vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', { buffer = true, noremap = true })
  --           vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
  --         end,
  --       },
  --       projectionist = {
  --         enable = true,
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  -- },
}
