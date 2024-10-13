return { -- You can easily change to a different colorscheme.
  { 'folke/tokyonight.nvim' },
  { 'savq/melange-nvim' },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  {
    'https://github.com/p00f/alabaster.nvim',
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'alabaster'
    end,
  },
  { 'dgox16/oldworld.nvim' },
}
