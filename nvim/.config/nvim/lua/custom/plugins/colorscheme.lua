return {
  { 'ellisonleao/gruvbox.nvim' },
  { 'kaiuri/nvim-juliana' },
  { 'mhartington/oceanic-next' },
  { 'ricardoraposo/gruvbox-minor.nvim' },
  { 'ferdinandrau/lavish.nvim' },
  { 'HoNamDuong/hybrid.nvim' },
  { 'kvrohit/rasmus.nvim' },
  { 'github-nvim-theme' },
  { 'felipeagc/fleet-theme-nvim' },
  {
    'tanvirtin/monokai.nvim',
    init = function()
      vim.cmd 'colorscheme monokai'
    end,
  },
}
