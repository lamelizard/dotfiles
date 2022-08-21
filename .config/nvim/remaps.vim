"Leader = Space
nnoremap <SPACE> <leader>
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

"small changes to how vim works
"keep n/N centered
nnoremap n nzzzv
nnoremap N Nzzzv
"concat? do not move
nnoremap J mzJ`z
"Y may only yank rest of line
nnoremap Y yg$
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
"undo only until here
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ; ;<c-g>u
inoremap ? ?<c-g>u
