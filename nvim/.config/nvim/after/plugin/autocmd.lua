-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
  pattern = "plugins.lua",
  -- command = "so % | PackerSync",
  command = "so % | PackerInstall",
})

vim.cmd("autocmd FileType pandoc normal zR")

local attach_to_buffer = function(file)
	local created_buffer = vim.api.nvim_create_buf(0, 1)
	local append_data = function(_, data)
		if data then
			vim.api.nvim_command("vertical sb" .. created_buffer)
			vim.api.nvim_buf_set_lines(created_buffer, -1, -1, false, data)
			vim.api.nvim_buf_call(created_buffer, function()
				vim.api.nvim_command("set syntax=json")
				vim.api.nvim_command("%!jq .")
			end)
		end
	end
	vim.fn.jobstart({ "hurl", file .. ".hurl" }, {
		stdout_buffered = true,
		on_stdout = append_data,
	})
end

vim.api.nvim_create_user_command("ApiThing", function()
	local file = vim.fn.input("File name :")
	attach_to_buffer(file)
end, {})

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
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>crc !!basename %:r<CR><leader>tfw<leader>ecggo]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>mp ciwPromise<><esc>hp ]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>mfa Iasync <esc> ]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>maa 0f(iasync <esc> ]])

-- go
vim.cmd([[au FileType go nmap <leader>al yiwofmt.Println(<esc>pa)<esc>]])

vim.cmd([[au FileType sql set shiftwidth=4 ]])
vim.cmd([[au FileType sql set tabstop=4 ]])
vim.cmd([[au FileType sql set softtabstop=4 ]])
