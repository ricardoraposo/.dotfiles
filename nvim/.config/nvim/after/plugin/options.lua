local o = vim.opt

o.guicursor = "n-sm:block,i-ci-ve:ver25-iCursor,r-cr-o:hor20,v-c:block-iCursor"
o.backup = false
o.backupcopy = "yes"
o.cmdheight = 1
o.conceallevel = 1
o.concealcursor = "nc"
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
o.softtabstop = 2
o.cursorline = false
o.numberwidth = 2
o.signcolumn = "no"
o.laststatus = 2
o.ruler = false
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.hidden = true
o.foldmethod = "manual"
-- o.colorcolumn = "80"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.shortmess:append("c")
o.clipboard:append({ "unnamedplus" })

vim.g.OmniSharp_server_use_net6 = 1
vim.g.OmniSharp_server_stdio = 1
vim.g.OmniSharp_highlighting = 0
-- vim.g.OmniSharp_server_use_mono = 1


vim.cmd("language en_US.UTF-8")
vim.cmd("set t_ZH=^[[3m")
vim.cmd("set t_ZR=^[[23m")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")
vim.cmd("set iskeyword-=_")
vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")
vim.cmd("let g:rainbow_active = 1")
vim.cmd("syntax on")

function GitBranch()
  local ok, _ = os.rename(vim.fn.getcwd() .. '/.git', vim.fn.getcwd() .. '/.git')
  if not ok then
    return ''
  end

  local fp = io.popen('git branch --show-current')
  local branch = fp:read('*a')
  if not branch then
    return ''
  end

  branch = string.gsub(branch, '\n', '')
  return [[ ]] .. branch .. [[ > ]]
end

vim.opt.statusline = "%#Normal# %-{luaeval('GitBranch()')}%f %m %=%r %=  %{battery#sign()} %{battery#value()}%%%10( %{strftime('%H:%M')} %)"
