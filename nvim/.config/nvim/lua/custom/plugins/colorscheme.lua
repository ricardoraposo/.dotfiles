return { -- You can easily change to a different colorscheme.
  { 'folke/tokyonight.nvim' },
  { 'rose-pine/nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  {
    'savq/melange-nvim',
  },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  { 'dgox16/oldworld.nvim' },
  { 'ilof2/posterpole.nvim' },
  {
    'AlexvZyl/nordic.nvim',
    init = function()
      vim.cmd.colorscheme 'nordic'
      vim.api.nvim_set_hl(0, 'Delimiter', { fg= "#60728a" })
    end,
  },
}
