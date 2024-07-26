-- vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"
--
-- dofile(vim.g.base46_cache .. "defaults")
-- dofile(vim.g.base46_cache .. "devicons")
-- dofile(vim.g.base46_cache .. "git")
-- dofile(vim.g.base46_cache .. "lsp")
-- dofile(vim.g.base46_cache .. "mason")
-- dofile(vim.g.base46_cache .. "nvimtree")
-- dofile(vim.g.base46_cache .. "syntax")
-- dofile(vim.g.base46_cache .. "treesitter")
-- dofile(vim.g.base46_cache .. "telescope")

-- Default options:
require("gruvbox").setup({
	contrast = "hard",
	transparent_mode = true,
})

require("vitesse").setup({
	transparent_background = true,
})

vim.cmd.colorscheme("tokyonight-storm")
