return {
  {
    'norcalli/nvim-colorizer.lua',
    opts = {},
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      plugins = {
        tmux = {
          enabled = true,
        },
      },
    },
  },
  {
    'wakatime/vim-wakatime',
    lazy = false,
  },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'FabijanZulj/blame.nvim',
    opts = {
      blame_options = { '-w' },
    },
  },
}
