vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function ()
    vim.lsp.buf.format()
  end
})
