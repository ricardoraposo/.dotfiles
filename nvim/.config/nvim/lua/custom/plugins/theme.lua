return {
  -- 'nvim-lua/plenary.nvim',
  -- { 'nvim-tree/nvim-web-devicons', lazy = true },
  --
  -- {
  --   'nvchad/ui',
  --   config = function()
  --     require 'nvchad'
  --   end,
  -- },
  --
  -- {
  --   'nvchad/base46',
  --   lazy = true,
  --   build = function()
  --     require('base46').load_all_highlights()
  --   end,
  -- },
  --
  -- 'nvchad/volt',

  { 'tjdevries/colorbuddy.nvim' },
  {
    'ellisonleao/gruvbox.nvim',
    opts = {
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      contrast = 'hard',
    },
  },
  { 'HoNamDuong/hybrid.nvim' },
  { 'rebelot/kanagawa.nvim' },
}
