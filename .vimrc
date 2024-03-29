" install vim-plug: https://github.com/junegunn/vim-plug
" run :PlugUpdate
call plug#begin()
Plug 'junegunn/fzf'
" fanfigtastic requires repeat
Plug 'tpope/vim-repeat'
Plug 'dahu/vim-fanfingtastic'
" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdtree'
call plug#end()

" don't be vi compatible
set nocompatible

set encoding=utf-8

"Security
set modelines=0

set number
set ruler

"Leader = Space
let mapleader = "\<space>"
let maplocalleader = "\\"

"easy escape
:inoremap jk <Esc>
:inoremap kj <Esc>
:inoremap kk <Esc>

"swap (semi-)colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"cursor motion
"keep cursor away from edges
set scrolloff=5
"better backspace
set backspace=indent,eol,start
"<these are braces>
set matchpairs+=<:>
"status bar
set laststatus=2

set showmode
set showcmd

"search
set ignorecase
set smartcase
set incsearch
set wrapscan
set showmatch

set listchars=tab:?\ ,eol:

"small changes to how vim works
"keep n/N centered
nnoremap n nzzzv
nnoremap N Nzzzv
"concat? do not move
nnoremap J mzJ`z
"move marked lines with J,K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"Y may only yank rest of line
--nnoremap Y yg$
"yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
"paste from clipboard
nnoremap <leader>p "+p
xnoremap <leader>p "+p    
"when pasting in v-mode, do not override the default register
xnoremap p "_dP
"delete to nowhere
nnoremap <leader>d "_d
vnoremap <leader>d "_d
"broken in Intellij?:
"undo only until here
"inoremap . .<c-g>u
"inoremap , ,<c-g>u
"inoremap ; ;<c-g>u
"inoremap ? ?<c-g>u
