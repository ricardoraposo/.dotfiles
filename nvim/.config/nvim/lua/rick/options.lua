local o = vim.opt

o.guicursor = "i:block"
o.backup = false
o.backupcopy = "yes"
o.cmdheight = 1
o.conceallevel = 0
o.fileencoding = "utf-8"
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.mouse = "a"
o.pumheight = 10
o.showmode = true
o.showtabline = 0
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.termguicolors = true
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 50
o.writebackup = false
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.signcolumn = "no"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.hidden = true
o.laststatus = 0
o.ruler = false
-- o.winbar = "%=%m %t - %n"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.shortmess:append("c")
o.clipboard:append({ "unnamedplus" })

vim.cmd("set t_ZH=^[[3m")
vim.cmd("set t_ZR=^[[23m")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")
vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")
vim.cmd("let g:rainbow_active = 1")
vim.cmd("colorscheme benjamin")
