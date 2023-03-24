call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'skammer/vim-css-color'

call plug#end()

" Sets the terminal color to 256 colors.
set t_Co=256

" Enable mouse support
set mouse=a


"  Sets the color space for the base16 color scheme to 256.
let base16colorspace=256

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Sets the number of commands to keep in the command-line history to 500
set history=500

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number


" Highlight cursor line underneath the cursor horizontally.
" set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup


" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Automatically reloads the file if it has been changed outside of Vim
set autoread

" Sets the language to English
let $LANG='en'

" Sets the language for the menu to English
set langmenu=en

" Use highlighting when doing a search.
set hlsearch

" Sets the encoding to UTF-8
set encoding=utf8

" Prevents Vim from creating a swap file
set noswapfile

" Detects the file format (Unix, DOS, or Mac) automatically
set ffs=unix,dos,mac

" Enable auto completion menu after pressing TAB.
set wildmenu

" :w!! 
" write the file when you accidentally opened it without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Enables auto-indentation
set ai

" Smart indenting for special cases (e.g. C comments)
set si

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
