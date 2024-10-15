return { -- You can easily change to a different colorscheme.
  { 'folke/tokyonight.nvim' },
  {
    'savq/melange-nvim',
    init = function()
      vim.cmd.colorscheme 'melange'
    end,
  },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  {
    'dgox16/oldworld.nvim',
  },
}
