-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd("autocmd FileType pandoc normal zR")

vim.api.nvim_create_user_command('Command', function (args)
  local vimCmd = 'split | terminal'
  if (args['args']) then
    vimCmd = vimCmd .. ' ' .. args['args']
  end
  vim.cmd(vimCmd)
end, { desc = "Runs command in builtin terminal", nargs = '*' })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "set wrap"})
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", command = "set conceallevel=1"})

-- stuff
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- html
vim.cmd([[au FileType html nmap <leader>ac 0f<ea class=""<esc>i]])

-- js 
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>ac 0f<ea className=""<esc>i]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>al yiwoconsole.log('<esc>pa: ', <esc>pa);<esc>]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>ec yiwGo<CR>export default ;<esc>hp]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>em yiwGo<CR>module.exports = ;<esc>hp]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>crc !!basename %:r<CR><leader>tfw<leader>ecggo]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>mp ciwPromise<><esc>hp ]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>mfa Iasync <esc> ]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>maa 0f(iasync <esc> ]])

-- go
vim.cmd([[au FileType go nmap <leader>al yiwofmt.Println(<esc>pa)<esc>]])

vim.cmd([[au FileType sql set shiftwidth=4 ]])
vim.cmd([[au FileType sql set tabstop=4 ]])
vim.cmd([[au FileType sql set softtabstop=4 ]])
