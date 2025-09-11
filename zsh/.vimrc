" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" call plug#begin('~/.local/share/vim/plugins')
" Plug 'tpope/vim-commentary'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'christoomey/vim-tmux-navigator'
" call plug#end()

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
set re=0
set sidescrolloff=8
set nohlsearch
set incsearch
set ignorecase
set noswapfile
set foldmethod=manual
set nofoldenable
set hidden
set splitbelow
set splitright
set signcolumn=no
set foldcolumn=0
set wildmenu
set undodir=$HOME/.vim/undodir
set undofile
set nospell
set spc=
set ruf=%35(%=%#Ruler#%.50F\ [%{&ft}]\ %l:%c\ %p%%%)
set shortmess-=S
set colorcolumn=80
set clipboard^=unnamed,unnamedplus

" syntax on

 " This is only necessary if you use "set termguicolors".
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

 " fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256

set termguicolors

" keymaps
" let mapleader=" "

" let g:tmux_navigator_no_mappings = 1

nnoremap G Gzz
nnoremap <C-c> <esc>
nnoremap <leader><leader> <C-^>
nnoremap <leader>sc <cmd>so %<CR>
nnoremap <C-f> :GitFiles<CR> 
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

"nnoremap <silent> <C-l> :<C-U>TmuxNavigateLeft<cr>
"nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
"nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
"nnoremap <silent> <C-h> :<C-U>TmuxNavigateRight<cr>

" Human error
command! Wq wq
command! W w
command! Q q

" autocmds
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
