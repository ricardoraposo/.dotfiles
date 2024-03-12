vim.cmd.colorscheme("melange")
local fg = "#c1c1c1"
local bg = "#212121"
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE", fg = bg })
vim.api.nvim_set_hl(0, "Property", { bg = "NONE", fg = fg })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030", fg = "NONE" })

-- vesper shit
-- vim.api.nvim_set_hl(0, "Type", { fg = "#ffcfa8" })
-- vim.api.nvim_set_hl(0, "Attribute", { fg = "#ffcfa8" })
