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
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.signcolumn = "no"
o.laststatus = 2
-- o.statusline = "%#LineNr#%f %m %=%r"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.hidden = true
o.ruler = true
o.colorcolumn = "80"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.shortmess:append("c")
o.clipboard:append({ "unnamedplus" })

-- Colorscheme config
vim.g.gruvbox_italic = 1
vim.g.gruvbox_bold = 0
vim.g.gruvbox_contrast_dark = "medium"
vim.cmd("colorscheme base16-tomorrow-night")
vim.cmd("syntax on")
vim.api.nvim_set_hl(0, "CursorLine", { fg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "none", fg = "#fabd2f" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })

vim.cmd("set t_ZH=^[[3m")
vim.cmd("set t_ZR=^[[23m")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")
vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")
vim.cmd("let g:rainbow_active = 1")
