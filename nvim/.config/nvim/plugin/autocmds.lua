vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('expand-tab', { clear = true }),
  callback = function()
    vim.opt.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.md' },
  group = vim.api.nvim_create_augroup('wrap-markdown', { clear = true }),
  callback = function()
    vim.opt.wrap = true
  end,
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = { '*.md' },
  group = vim.api.nvim_create_augroup('wrap-markdown', { clear = true }),
  callback = function()
    vim.opt.wrap = false
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- vim.api.nvim_create_autocmd('VimEnter', {
--   group = vim.api.nvim_create_augroup('no-neck-pain', { clear = true }),
--   callback = function() vim.cmd("NoNeckPain") end,
-- })

-- stuff
vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

-- js
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>al yiwoconsole.log('<esc>pa: ', <esc>pa)<esc>]]
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>ec yiwGo<CR>export default ;<esc>hp]]
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>em yiwGo<CR>module.exports = ;<esc>hp]]
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>crc !!basename %:r<CR><leader>tfw<leader>ecggo]]
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>mp ciwPromise<><esc>hp ]]
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>mfa Iasync <esc> ]]
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>maa 0f(iasync <esc> ]]

-- go
vim.cmd [[au FileType go set tabstop=4]]
vim.cmd [[au FileType go set shiftwidth=4]]
vim.cmd [[au FileType go set expandtab]]
vim.cmd [[au FileType go nmap <leader>al yiwofmt.Println(<esc>pa)<esc>]]
vim.cmd [[au FileType go nmap <leader>ge <cmd>GoIfErr<CR>]]
vim.cmd [[au FileType go nmap <leader>gt <cmd>GoTagAdd<CR>]]

-- elixit
vim.cmd [[au FileType elixir nmap <leader>al yiwoIO.inspect(<esc>pa)<esc>]]
