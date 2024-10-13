return { -- You can easily change to a different colorscheme.
  { 'folke/tokyonight.nvim' },
  { 'savq/melange-nvim' },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  {
    'dgox16/oldworld.nvim',
    init = function()
      vim.cmd.colorscheme 'oldworld'
    end,
  },
}
