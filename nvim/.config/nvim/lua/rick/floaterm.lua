local term_opts = { silent = true }
local keymap = vim.keymap.set

vim.api.nvim_set_hl(0, "FloatermBorder", {
	bg = "#1d2021",
	fg = "#ebdbb2",
})

vim.api.nvim_set_hl(0, "Floaterm", {
	bg = "#1d2021",
})

keymap({ "n", "t" }, [[<c-\>]], "<cmd>FloatermToggle<CR>", term_opts)
keymap("t", "<c-k>", "<cmd>FloatermNew<CR>", term_opts)
keymap("t", "<c-n>", "<cmd>FloatermNext<CR>", term_opts)
keymap("t", "<c-p>", "<cmd>FloatermPrev<CR>", term_opts)
