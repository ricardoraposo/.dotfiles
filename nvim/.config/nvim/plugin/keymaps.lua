local map = vim.keymap.set
-- Disable arrow keys
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('t', '<esc>', '<C-\\><C-n>')
map('n', '<leader>rt', ':15split | terminal ')

-- I'm stupid
map('i', '<C-c>', '<Esc>')
map('n', '<leader><leader>', '<C-^>', { desc = 'Alternate files' })
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move text around
map('v', '<S-j>', ':m .+1<CR>==')
map('v', '<S-k>', ':m .-2<CR>==')
map('x', 'J', ":move '>+1<CR>gv-gv")
map('x', 'K', ":move '<-2<CR>gv-gv")

-- Better navigation
map({ 'n', 'v', 'x' }, '{', '}')
map({ 'n', 'v', 'x' }, '}', '{')

-- Use of function row
map('n', '<F1>', '<cmd>set nu!<CR>')
map('n', '<F2>', '<cmd>set rnu!<CR>')
map('n', '<F3>', '<cmd>set cursorcolumn!<CR>')
map('n', '<F4>', '<cmd>set cursorline!<CR>')
map('n', '<F5>', '<cmd>set wrap!<CR>')

-- terminal integration
map('n', '<leader>tf', '!!turnFunction<CR>')

-- Resize with arrows
map('n', '<M-Up>', '<cmd>resize +2<CR>')
map('n', '<M-Down>', '<cmd>resize -2<CR>')
map('n', '<M-Left>', '<cmd>vertical resize +2<CR>')
map('n', '<M-Right>', '<cmd>vertical resize -2<CR>')

-- I like splits
map('n', '<leader>vv', '<cmd>vsplit<CR>')
map('n', '<leader>v-', '<cmd>split<CR>')
map('n', '<leader>vt', '<cmd>vsplit | terminal<CR>')

-- Cool remaps
map('n', 'G', 'Gzz')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'Y', 'y$')
map('n', '<leader><', '0f>ldt<')
map('n', '<leader>so', '<cmd>so %<cr>')

-- Human error
vim.cmd 'command! Wq wq'
vim.cmd 'command! W w'
vim.cmd 'command! Q q'
