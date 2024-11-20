return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      color_overrides = {
        mocha = {
          base = '#1f1e22',
          mantle = '#232224',
        },
      },
    },
  },
  { 'folke/tokyonight.nvim' },
  { 'killitar/obscure.nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  {
    'ferdinandrau/lavish.nvim',
    init = function()
      vim.cmd.colorscheme 'lavish'
    end,
  },
  { 'HoNamDuong/hybrid.nvim' },
  { 'kvrohit/rasmus.nvim' },
  { 'https://github.com/projekt0n/github-nvim-theme' },
}
