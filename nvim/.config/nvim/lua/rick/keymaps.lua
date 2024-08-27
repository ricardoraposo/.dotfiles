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

-- Normal
keymap("n", "<leader>se", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
keymap("n", "<M-b>", ":NvimTreeToggle<CR>", opts)
keymap("i", "<C-Right>", "<Plug>(copilot-accept-word)")

-- Resize with arrows
keymap("n", "<M-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<M-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<M-Left>", "<cmd>vertical resize +2<CR>", opts)
keymap("n", "<M-Right>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<leader>vv", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>v-", "<cmd>split<CR>", opts)
keymap("n", "<leader>vt", "<cmd>vsplit | terminal<CR>", opts)

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
keymap("v", "<leader>y", "<Plug>OSCYankVisual", opts)

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
keymap("n", "<C-f>", "<cmd>FzfLua files<CR>", opts)
keymap("n", "<leader>dn", "<cmd>Telescope find_files cwd=~/.config/nvim/<CR>", opts)
keymap("n", "<leader>do", "<cmd>Telescope find_files cwd=~/Documents/zet/<CR>", opts)
keymap("n", "<leader>df", "<cmd>lua require'telescope.builtin'.find_files( { cwd = vim.fn.expand('%:p:h') })<CR>", opts)
keymap("n", "<leader>db", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'telescope.builtin'.registers()<CR>", opts)
keymap("n", "<leader>dg", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'telescope.builtin'.colorscheme()<CR>", opts)
keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", opts)
keymap("n", "<leader>du", "<cmd>Telescope undo<CR>", opts)

-- Fodase plugins
keymap("n", "<leader>tt", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<cr>", opts)
keymap("n", "<leader>rc", "<cmd>make<CR>", opts) -- Run Code
keymap({ "n", "v" }, "<leader>arn", "<Plug>RestNvim", opts)
keymap("n", "<leader>arp", "<Plug>RestNvimPreview", opts)
keymap("n", "<leader>arl", "<Plug>RestNvimLast", opts)

-- Angular shit
local ng = require("ng")
vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, opts)
vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, opts)
vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)

-- Command line integration
keymap("n", "<leader>rt", ":15split | terminal ", opts)
keymap("t", "<esc>", "<C-\\><C-n>", opts)
keymap("n", "<leader>ta", "!!turnArrow<CR>Vj=", opts)
keymap("n", "<leader>tf", "!!turnFunction<CR>Vj=", opts)
keymap("n", "<leader>ts", "!!turnState<CR>Vj=A;<esc>F(", opts)

-- Better navigation
keymap({ "n", "v", "x" }, "{", "}", opts)
keymap({ "n", "v", "x" }, "}", "{", opts)
keymap("n", "<leader>bh", "<cmd>lua require('barbecue.ui').navigate(1)<cr>")
keymap("n", "<leader>bj", "<cmd>lua require('barbecue.ui').navigate(2)<cr>")
keymap("n", "<leader>bk", "<cmd>lua require('barbecue.ui').navigate(3)<cr>")
keymap("n", "<leader>bl", "<cmd>lua require('barbecue.ui').navigate(4)<cr>")

-- Format shit
keymap({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, opts)


-- Greatest remaps
keymap("n", "G", "Gzz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "Y", "y$", opts)
keymap("n", "<leader><", "0f>ldt<", opts)
keymap("n", "<leader>sc", "<cmd>so %<cr>", opts)
keymap("n", "<leader>so", "<cmd>so ~/.config/nvim/lua/rick/colors.lua<cr>", opts)

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
