--Leader = Space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--easy escape
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")

--swap (semi-)colon
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("v", ";", ":")
vim.keymap.set("v", ":", ";")

--small changes to how vim works
--keep n/N centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--concat? do not move
vim.keymap.set("n", "J", "mzJ`z")
--move marked lines with J,K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Y may only yank rest of line
--vim.keymap.set("n", "Y", "yg$")
--yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "gg\"+yG")
--paste from clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("x", "<leader>p", "\"+p")    
--when pasting in v-mode, do not override the default register
vim.keymap.set("x", "p", "\"_dP")
--delete to nowhere
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
--undo only until here
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
