vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- stuff
vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

-- js
vim.cmd [[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>al yiwoconsole.log('<esc>pa: ', <esc>pa);<esc>]]
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
