local opts = { noremap = true, silent = true }

--Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--	 normal mode = "n"
--	 insert mode = "i"
--	 visual mode = "v"
--	 visual-block mode = "x"
--	 term mode = "t"
--	 command mode = "c"

-- Disabling dumb stuff
keymap("n", "<Up>", ":echoerr 'do better and use k, kid!'<CR>", opts)
keymap("n", "<Down>", ":echoerr 'do better and use j, kid!'<CR>", opts)
keymap("n", "<Right>", ":echoerr 'do better and use l, kid!'<CR>", opts)
keymap("n", "<Left>", ":echoerr 'do better and use h, kid!'<CR>", opts)
keymap("i", "<Up>", "<nop>", opts)
keymap("i", "<Down>", "<nop>", opts)
keymap("i", "<Left>", "<nop>", opts)
keymap("i", "<Right>", "<nop>", opts)

-- Normal
keymap("n", "<leader>se", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<M-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<M-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<M-Left>", "<cmd>vertical resize +2<CR>", opts)
keymap("n", "<M-Right>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<leader>vv", "<cmd>silent !tmux split-window -h<CR>", opts)
keymap("n", "<leader>vh", "<cmd>silent !tmux split-window<CR>", opts)

-- Buffer commands
keymap("n", "<leader>qb", ":bd<CR>", opts)
keymap("n", "<leader><leader>", "<C-^>", opts) -- Toggle between last buffers

-- Insert --
-- Goes to insert mode
keymap("i", "<C-c>", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap('v', 'y', '<Plug>OSCYankVisual', opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<C-f>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>dn", "<cmd>Telescope find_files cwd=~/.config/nvim/<CR>", opts)
keymap("n", "<leader>do", "<cmd>Telescope find_files cwd=~/Documents/zet/<CR>", opts)
keymap("n", "<leader>df", "<cmd>lua require'telescope.builtin'.find_files( { cwd = vim.fn.expand('%:p:h') })<CR>", opts)
keymap("n", "<leader>db", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'telescope.builtin'.colorscheme()<CR>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'telescope.builtin'.registers()<CR>", opts)
keymap("n", "<leader>dg", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", opts)
keymap("n", "<leader>du", "<cmd>Telescope undo<CR>", opts)

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
keymap("n", "<leader>mm", mark.add_file)
keymap("n", "<C-e>", ui.toggle_quick_menu)
keymap("n", "<C-j>", "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", opts)
keymap("n", "<C-k>", "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", opts)
keymap("n", "<C-l>", "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", opts)
keymap("n", "<C-h>", "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", opts)

-- Fodase plugins
keymap("n", "<leader>tt", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", opts)
keymap("n", "<leader>rc", "<cmd>make<CR>", opts) -- Run Code
keymap("n", "<leader>arn", "<Plug>RestNvim", opts)
keymap("n", "<leader>arp", "<Plug>RestNvimPreview", opts)
keymap("n", "<leader>arl", "<Plug>RestNvimLast", opts)
keymap("n", "<leader>tc", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", opts)

-- Command line integrations
keymap("n", "<leader>rt", ":Command ", opts)
keymap("t", "<esc>", "<C-\\><C-n>", opts)
keymap("n", "<leader>ta", "!!turnArrow<CR>Vj=", opts)
keymap("n", "<leader>tf", "!!turnFunction<CR>Vj=", opts)
keymap("n", "<leader>ts", "!!turnState<CR>Vj=A;<esc>F(", opts)

-- Better navigation
keymap({ "n", "v", "x" }, "{", "}", opts)
keymap({ "n", "v", "x" }, "}", "{", opts)

-- Greatest remaps
keymap("n", "G", "Gzz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "<leader><", "0f>ldt<", opts)
keymap("n", "<leader>sc", "<cmd>so %<cr>", opts)
keymap("n", "<leader>so", "<cmd>so ~/.config/nvim/after/plugin/colors.lua<cr>", opts)

-- Use of function row
keymap("n", "<F1>", "<cmd>set nu!<CR>", opts)
keymap("n", "<F2>", "<cmd>set rnu!<CR>", opts)
keymap("n", "<F3>", "<cmd>set cursorcolumn!<CR>", opts)
keymap("n", "<F4>", "<cmd>set cursorline!<CR>", opts)
keymap("n", "<F5>", "<cmd>set wrap!<CR>", opts)
keymap("n", "<F10>", "<cmd>TSCaptureUnderCursor<CR>", opts)

vim.cmd("inoremap , ,<c-g>u")
vim.cmd("inoremap . .<c-g>u")
vim.cmd("inoremap ! !<c-g>u")
vim.cmd("inoremap ? ?<c-g>u")

-- Human error
vim.cmd("command! Wq wq")
vim.cmd("command! W w")
vim.cmd("command! Q q")
