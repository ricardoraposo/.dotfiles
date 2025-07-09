return {
  -- 'nvim-lua/plenary.nvim',
  -- { 'nvim-tree/nvim-web-devicons', lazy = true },
  --
  -- {
  --   'nvchad/ui',
  --   config = function()
  --     require 'nvchad'
  --   end,
  -- },
  --
  -- {
  --   'nvchad/base46',
  --   lazy = true,
  --   build = function()
  --     require('base46').load_all_highlights()
  --   end,
  -- },
  --
  -- 'nvchad/volt',

  {
    'tjdevries/colorbuddy.nvim',
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        bold = false,
        contrast = 'hard',
      }
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
