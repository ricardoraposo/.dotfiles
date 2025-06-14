return {
  { 'yioneko/nvim-vtsls' },
  {
    'davidmh/mdx.nvim',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'dmmulroy/tsc.nvim',
    opts = {},
  },
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
  {
    'catppuccin/nvim',
    as = 'catppuccin',
  },
}
