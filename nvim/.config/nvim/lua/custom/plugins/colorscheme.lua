return { -- You can easily change to a different colorscheme.
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  { 'savq/melange-nvim' },
}
