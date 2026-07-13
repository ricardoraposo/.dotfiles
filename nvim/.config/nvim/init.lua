vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.omni_sql_no_default_maps = 1

require 'config'

vim.pack.add {
  'https://github.com/ember-theme/nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/christoomey/vim-tmux-navigator',
}

-- oil
require('oil').setup()

-- herdr navigator
vim.g.tmux_navigator_no_mappings = 1
dofile(vim.fn.expand '~/.config/herdr/plugins/config/vim-herdr-navigation/vim-herdr-navigation/editor/nvim.lua')

-- theme
vim.cmd.colorscheme 'ember'
