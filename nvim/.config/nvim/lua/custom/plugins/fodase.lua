return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        DEFAULT_OPTIONS = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue
          RRGGBBAA = false, -- #RRGGBBAA hex codes
          rgb_fn = false, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          mode = 'background', -- Set the display mode.
        },
      }
    end,
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      plugins = {
        tmux = {
          enabled = true,
        },
      },
    },
  },
  {
    'wakatime/vim-wakatime',
    lazy = false,
  },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'FabijanZulj/blame.nvim',
    opts = {
      blame_options = { '-w' },
    },
  },
}
