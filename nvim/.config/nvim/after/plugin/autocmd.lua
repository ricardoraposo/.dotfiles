-- Attach format options on buffer creation
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("set_formatoptions", { clear = true }),
	command = "set formatoptions-=cro",
})

vim.cmd("autocmd BufReadPost,FileReadPost * normal zR")

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

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- html
vim.cmd([[au FileType html nmap <leader>ac 0f<ea class=""<esc>i]])

-- js 
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>ac 0f<ea className=""<esc>i]])
vim.cmd([[au FileType typescript,typescriptreact,javascript,javascriptreact nmap <leader>al yiwoconsole.log('<esc>pa: ', <esc>pa);<esc>]])

-- go
vim.cmd([[au FileType go nmap <leader>al yiwofmt.Println(<esc>pa)<esc>]])
