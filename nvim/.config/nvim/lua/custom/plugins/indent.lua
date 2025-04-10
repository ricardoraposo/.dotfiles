return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ft = { 'python' },
  config = function()
    local hooks = require 'ibl.hooks'

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'MagicalThingy', { fg = '#1e2323', bg = 'none' })
    end)

    require('ibl').setup {
      indent = {
        highlight = {
          'MagicalThingy',
        },
      },
      scope = { enabled = false },
    }
  end,
}
