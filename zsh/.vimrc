
call plug#begin('~/.local/share/vim/plugins')
  Plug 'morhetz/gruvbox'
  Plug 'crusoexia/vim-monokai'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax' 
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
call plug#end()

set autowrite
set nowritebackup
set noswapfile
set nobackup
set showmode
set smartindent
set ruler
set undofile
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
set wildmenu
set nospell
set spelllang=en,pt_br
set ruf=%45(%=%#Ruler#%.50F\ [%{&ft}]\ %l:%c\ %p%%%)
set shortmess-=S

syntax on
colorscheme rwx

let g:markdown_fenced_languages = ['bash', 'js=javascript']
let g:pandoc#syntax#codeblocks#embeds#langs = ['javascript', 'sh']
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 72

let mapleader=" "
nnoremap <leader><leader> <C-^>
nnoremap <C-c> <esc>
nnoremap G Gzz
