local o = vim.opt
local g = vim.g

o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20"
o.bg = "dark"
o.compatible = false
o.termguicolors = true
o.backup = false
o.backupcopy = "yes"
o.autowrite = true
o.cmdheight = 1
o.conceallevel = 0
o.nu = true
o.rnu = true
o.concealcursor = "nc"
-- o.fileencoding = "utf-8"
o.hlsearch = false
o.incsearch = true
o.inccommand = "split"
o.ignorecase = true
o.mouse = "a"
o.pumheight = 10
o.showmode = true
o.showcmd = true
o.showtabline = 0
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 50
o.writebackup = false
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.cursorline = false
o.numberwidth = 2
-- o.signcolumn = "no"
o.colorcolumn = "80,100"
o.laststatus = 1
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 16
o.hidden = true
-- o.foldmethod = "manual"
o.foldenable = false
o.ru = true
o.ruf = "%80(%=  %#LineNr#%.50F %m[%{&ft}] %{coc#status()}%)"
o.lcs = "tab:• ,trail:-,nbsp:+"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.shortmess:append("c")
o.clipboard:append({ "unnamedplus" })
o.pumblend = 17
o.wildmode = "longest:full"
o.wildoptions = "pum"

vim.cmd("language en_US.UTF-8")
vim.cmd("set t_ZH=^[[3m")
vim.cmd("set t_ZR=^[[23m")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword-=_")
vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")
vim.cmd("let g:pandoc#spell#enabled=0")
vim.cmd("let g:pandoc#folding#fdc = 0")
vim.cmd("syntax on")
g.markdown_fenced_languages = { "javascript", "sh" }
g.omni_sql_default_compl_type = "syntax"
g.omni_sql_no_default_maps = 1
g.db_ui_use_nerd_fonts = 1
