
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'klen/python-mode'
Plug 'skammer/vim-css-color'

call plug#end()

set t_Co=256
let base16colorspace=256

set number
set mouse=a
syntax on
filetype indent on
filetype plugin on
set history=500
set autoread

let $LANG='en'
set langmenu=en

set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
" set cursorline

" :w!! 
" write the file when you accidentally opened it without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null

set smarttab
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set wildmenu
set ai
set si
set wrap
