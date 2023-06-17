require("rose-pine").setup({
  disable_background = false,
  highlight_groups = {
    TelescopeBorder = { fg = "highlight_high", bg = "none" },
    TelescopeNormal = { bg = "none" },
    TelescopePromptNormal = { bg = "none" },
    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
    TelescopeSelection = { fg = "text", bg = "none" },
    TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
  },
})

require('catppuccin').setup({
  integrations = {
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "underdashed" },
      },
    }
  }
})

vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd("highlight Boolean guifg=#ff5c5c")
vim.cmd("highlight iCursor guibg=#ff5c5c")
-- vim.cmd("highlight iCursor guibg=#eb6f92")
