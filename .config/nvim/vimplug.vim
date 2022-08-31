" install vim-plug: https://github.com/junegunn/vim-plug
" run :PlugUpdate
call plug#begin()

"navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"fanfigtastic requires repeat
Plug 'tpope/vim-repeat'
Plug 'dahu/vim-fanfingtastic'

"snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"latex
Plug 'lervag/vimtex'

"linter
Plug 'dense-analysis/ale'

"tags
Plug 'ludovicchabant/vim-gutentags'

"autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-vimtex coc-clangd coc-cmake coc-docker coc-symbol-line

call plug#end()
