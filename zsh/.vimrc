call plug#begin('~/.local/share/vim/plugins')
  Plug 'tpope/vim-commentary'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'sheerun/vim-polyglot'
  Plug 'ericbn/vim-solarized'
call plug#end()

set path+=**
set autowrite
set nowritebackup
set noswapfile
set showmode
set showcmd
set cmdheight=1
set pumheight=10
set nowrap
set smartindent
set ruler
set expandtab 
set shiftwidth=2
set tabstop=2
set softtabstop=2
set scrolloff=8
set sidescrolloff=8
set nohlsearch
set incsearch
set ignorecase
set noswapfile
set clipboard=unnamed
set foldmethod=manual
set nofoldenable
set hidden
set splitbelow
set splitright
set signcolumn=no
set foldcolumn=0
set wildmenu
set undodir=$HOME/.vim/undovim
set undofile
set nospell
set spc=
set ruf=%35(%=%#Ruler#%.50F\ [%{&ft}]\ %l:%c\ %p%%%)
set shortmess-=S

syntax on
colorscheme default

if has("syntax")
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc
endif

" keymaps
let mapleader=" "
nnoremap G Gzz
nnoremap <C-c> <esc>
nnoremap <leader><leader> <C-^>
nnoremap <leader>sc <cmd>so %<CR>
nnoremap <C-f> :find 
nnoremap <F2> :call <SID>SynStack()<CR>
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" autocmds
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" golang stuff
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_auto_sameids = 0

" markdown stuff
let g:markdown_fenced_languages = ['bash', 'js=javascript']
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 72
let g:pandoc#modules#disabled = ["spell"]
