local term_opts = { silent = true }
local keymap = vim.keymap.set

vim.api.nvim_set_hl(0, "FloatermBorder", {
	fg = "#5eacd3",
})

vim.api.nvim_set_hl(0, "Floaterm", {
	bg = "None",
})

keymap({ "n", "t" }, [[<c-\>]], "<cmd>FloatermToggle<CR>", term_opts)
keymap("t", "<c-c>", "<cmd>FloatermNew<CR>", term_opts)
keymap("t", "<c-n>", "<cmd>FloatermNext<CR>", term_opts)
keymap("t", "<c-p>", "<cmd>FloatermPrev<CR>", term_opts)
