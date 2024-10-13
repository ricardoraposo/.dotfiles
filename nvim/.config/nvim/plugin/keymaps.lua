local map = vim.keymap.set
-- Disable arrow keys
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Remove hl search
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Move between panes
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('t', '<esc>', '<C-\\><C-n>')
map('n', '<leader>rt', ':15split | terminal ')

-- I'm stupid
map('n', '<C-c>', '<Esc>')
map('n', '<leader><leader>', '<C-^>', { desc = 'Alternate files' })

-- Cool remaps
map('n', 'G', 'Gzz')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'Y', 'y$')
map('n', '<leader><', '0f>ldt<')
map('n', '<leader>sc', '<cmd>so %<cr>')

-- Human error
vim.cmd 'command! Wq wq'
vim.cmd 'command! W w'
vim.cmd 'command! Q q'
