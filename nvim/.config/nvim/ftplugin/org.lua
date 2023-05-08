vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("add_column", { clear = true }),
  pattern = "*.org",
  command = "set colorcolumn=120",
})
