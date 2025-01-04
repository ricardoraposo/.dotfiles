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
    opts = {},
  },
  {
    'folke/snacks.nvim',
    opts = {
      lazygit = {},
      git = {},
    },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  { 'rcarriga/nvim-notify' },
  {
    'f-person/auto-dark-mode.nvim',
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value('background', 'dark', {})
        vim.cmd 'colorscheme nightwolf-dark-blue'
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value('background', 'light', {})
        vim.cmd 'colorscheme nightwolf-light'
      end,
    },
  },
  {
    dir = '~/Projects/Repos/nightwolf.nvim',
    opts = {},
  },
}
