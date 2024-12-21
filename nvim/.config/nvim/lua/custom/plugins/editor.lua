return {
  { 'yioneko/nvim-vtsls' },
  { 'rescript-lang/vim-rescript', ft = 'rescript' },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  { 'tpope/vim-sleuth' },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'folke/snacks.nvim',
    opts = {
      lazygit = {},
      git = {},
    },
  },
  {
    dir = '~/Projects/Repos/nightwolf.nvim',
    init = function()
      vim.cmd.colorscheme 'nightwolf'
    end,
  },
}
