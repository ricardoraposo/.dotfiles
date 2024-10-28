return { -- You can easily change to a different colorscheme.
  { 'folke/tokyonight.nvim' },
  { 'rose-pine/nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  {
    'savq/melange-nvim',
  },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  { 'dgox16/oldworld.nvim' },
  {
    'ilof2/posterpole.nvim',
    init = function()
      vim.cmd.colorscheme 'posterpole'
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
  },

  {
    'vague2k/vague.nvim',
  },
}
