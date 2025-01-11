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
    dir = '~/Projects/Repos/nightwolf.nvim',
    opts = {
      transparency = true,
      palette_overrides = {
        background = '#141b1e',
        red = '#e57474',
        lightRed = '#ef7e7e',
        white = '#dadada',
        blue = '#67b0e8',
        lightPurple = '#c47fd5',
        darkPurple = '#9696ff',
        cyan = '#6cbfbf',
        lightYellow = '#e5c76b',
        darkYellow = '#f4d67a',
        green = '#8ccf7e',
        black = '#141b1e',
        muted = '#dadada',
      },
    },
    init = function()
      vim.cmd.colorscheme 'nightwolf'
    end,
  },
}
