local options = {
  guicursor = "i:block",
  backup = false,
  backupcopy = "yes",
  cmdheight = 1,
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = false,
  incsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = true,
  showtabline = 0,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 50,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = false,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  hidden = true,
  laststatus = 0,
  ruler = false,
  winbar = "%=%m %t - %n",
}

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.shortmess:append("c")
vim.opt.clipboard:append({ "unnamedplus" })

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")
vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")
vim.cmd("let g:rainbow_active = 1")
