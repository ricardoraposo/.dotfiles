local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


keymap("n", "<C-e>", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>m", "<cmd>lua require'harpoon.mark'.add_file()<cr>", opts)

keymap("n", "<C-j>", "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", opts)
keymap("n", "<C-k>", "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", opts)
keymap("n", "<C-l>", "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", opts)
keymap("n", "<C-h>", "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", opts)

