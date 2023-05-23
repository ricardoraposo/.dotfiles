local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gd", "<cmd>OmniSharpGotoDefinition<CR>", opts)
vim.keymap.set("n", "<leader>gi", "<cmd>OmniSharpFindImplementations<CR>", opts)
