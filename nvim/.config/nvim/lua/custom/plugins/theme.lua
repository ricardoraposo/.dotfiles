return {
  { 'tjdevries/colorbuddy.nvim' },
  {
    'ellisonleao/gruvbox.nvim',
    opts = {
      bold = false,
      transparent_mode = true,
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
  { 'cocopon/iceberg.vim' },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      no_italic = true,
      no_bold = true,
    },
  },
  { 'nickkadutskyi/jb.nvim' },
  {
    'ricardoraposo/nightwolf.nvim',
    opts = {
      theme = 'dark-gray',
      italic = false,
    },
  },
  { 'Mofiqul/vscode.nvim' },
  { 'joshdick/onedark.vim' },
  { 'projekt0n/github-nvim-theme' },
}

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
