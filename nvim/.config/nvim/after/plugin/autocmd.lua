vim.api.nvim_create_user_command("AutoRun", function()
  print("AutoRun starts now")
  -- local bufnr = vim.fn.input("Bufnr: ")
  local bufnr = vim.api.nvim_get_current_buf()
  local pattern = vim.fn.input("Pattern: ")
  local command = vim.split(vim.fn.input("Command: "), " ")
  attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})

-- Attach format options on buffer creation
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("set_formatoptions", { clear = true }),
  command = "set formatoptions-=cro",
})

vim.cmd("autocmd BufReadPost,FileReadPost * normal zR")
