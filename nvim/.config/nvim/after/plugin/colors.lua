require("gruber-darker").setup({
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
})

vim.opt.guicursor = "i:block"
vim.cmd.colorscheme("gruber-darker")

-- Overrides
local fg = "#e4e4e4"
local fg1 = "#f4f4ff"
local fg2 = "#f5f5f5"
local white = "#ffffff"
local yellow = "#ffdd33"
local quartz = "#95a99f"
local niagara2 = "#303540"
local niagara1 = "#565f73"
local niagara = "#96a6c8"
local wisteria = "#9e95c7"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#222324" })
vim.api.nvim_set_hl(0, "typescriptBOMWindowMethod", { link = "typescriptIdentifierName" })

-- fuck treesitter highlighting
vim.api.nvim_set_hl(0, "@method.call", { fg = fg })
vim.api.nvim_set_hl(0, "@method", { fg = fg })
vim.api.nvim_set_hl(0, "@function.call", { fg = fg })
vim.api.nvim_set_hl(0, "@property", { fg = fg })
vim.api.nvim_set_hl(0, "@variable", { fg = fg })
vim.api.nvim_set_hl(0, "@keyword", { fg = quartz, bold = false })
vim.api.nvim_set_hl(0, "@keyword.coroutine", { fg = yellow, bold = false })
vim.api.nvim_set_hl(0, "@keyword.function", { fg = yellow, bold = false })
vim.api.nvim_set_hl(0, "@keyword.operator", { fg = yellow, bold = false })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = quartz })
