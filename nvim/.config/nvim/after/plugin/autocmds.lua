vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
	callback = function()
		vim.lsp.buf.format()
	end,
})
