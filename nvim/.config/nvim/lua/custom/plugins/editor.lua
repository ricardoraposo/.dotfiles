return {
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
}
