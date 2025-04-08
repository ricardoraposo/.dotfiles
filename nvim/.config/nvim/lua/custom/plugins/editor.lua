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
  { 'folke/tokyonight.nvim' },
  { 'rebelot/kanagawa.nvim' },
  {
    '2nthony/vitesse.nvim',
    dependencies = {
      'tjdevries/colorbuddy.nvim',
    },
  },
  {
    'rose-pine/nvim',
    as = 'rose-pine',
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  { 'sainnhe/gruvbox-material' },
  { 'felipeagc/fleet-theme-nvim' },
  {
    dir = '~/Projects/Repos/nightwolf.nvim',
  },
}
