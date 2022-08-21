" don't be vi compatible
set nocompatible

set encoding=utf-8
 
"Security
set modelines=0

"source .vimrc inside project folder
set exrc

set relativenumber
set nu
set ruler

"whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"cursor motion
"keep cursor away from edges
set scrolloff=4
"better backspace
set backspace=indent,eol,start
"<these are braces>
set matchpairs+=<:>
"status bar
set laststatus=2

"looks
highlight Normal guibg=none

set showmode
set showcmd
set signcolumn=yes

"search
set ignorecase
set smartcase
set incsearch
set wrapscan
set showmatch

"set listchars=tab:?\ ,eol:
