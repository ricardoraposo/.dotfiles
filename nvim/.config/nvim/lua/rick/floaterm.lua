local term_opts = { silent = true }
local keymap = vim.keymap.set

vim.api.nvim_set_hl(0, "FloatermBorder", {
	bg = "none",
	fg = "#41a7fc",
})

vim.api.nvim_set_hl(0, "Floaterm", {
	bg = "none",
})

keymap({ "n", "t" }, [[<c-\>]], "<cmd>FloatermToggle<CR>", term_opts)
keymap("t", "<c-k>", "<cmd>FloatermNew<CR>", term_opts)
keymap("t", "<c-h>", "<cmd>FloatermNext<CR>", term_opts)
keymap("t", "<c-l>", "<cmd>FloatermPrev<CR>", term_opts)
