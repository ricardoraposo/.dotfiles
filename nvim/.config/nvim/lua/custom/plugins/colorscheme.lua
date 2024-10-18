return { -- You can easily change to a different colorscheme.
  { 'folke/tokyonight.nvim' },
  { 'rose-pine/nvim' },
  {
    'savq/melange-nvim',
    init = function()
      vim.cmd.colorscheme 'melange'
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    end,
  },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  { 'dgox16/oldworld.nvim' },
  { 'ilof2/posterpole.nvim' },
}
