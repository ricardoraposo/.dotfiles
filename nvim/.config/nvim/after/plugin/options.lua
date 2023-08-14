local o = vim.opt
local g = vim.g

o.compatible = false
o.termguicolors = true
o.guicursor = "i:block"
o.backup = false
o.backupcopy = "yes"
o.autowrite = true
o.cmdheight = 1
o.conceallevel = 0
o.concealcursor = "nc"
o.fileencoding = "utf-8"
o.hlsearch = false
o.incsearch = true
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
o.signcolumn = "no"
o.laststatus = 0
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.hidden = true
o.foldmethod = "manual"
o.ruler = true
o.rulerformat = "%40(%= %#LineNr#%.50F %m[%{&ft}] %l:%c%)"
o.lcs = "tab:• ,trail:-,nbsp:+"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.shortmess:append("c")
o.clipboard:append({ "unnamedplus" })

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

require('auto-dark-mode').setup({
	update_interval = 1000,
	set_dark_mode = function()
		vim.api.nvim_set_option('background', 'dark')
		vim.cmd('colorscheme base16-gruvbox-dark-hard')
	end,
	set_light_mode = function()
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme base16-solarized-light')
	end,
})
-- vim.cmd.colorscheme("base16-gruvbox-dark-hard")
-- vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight LineNr ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight NvimTreeNormal ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight NvimTreeNormalFloat ctermbg=NONE guibg=NONE")
