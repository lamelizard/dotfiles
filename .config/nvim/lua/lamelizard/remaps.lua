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

--search and replace since I can never remember the keys
vim.keymap.set("n", "<leader>fr", ":s///g<Left><Left><Left>", {desc="search and replace"})

--small changes to how vim works

--keep n/N centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--concat? do not move
vim.keymap.set("n", "J", "mzJ`z", {desc="concat, don't move"})

--move marked lines with J,K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc="move lines down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc="move lines up"})

--Y may only yank rest of line
--vim.keymap.set("n", "Y", "yg$")

--yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y", {desc="yank to clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc="yank to clipboard"})
vim.keymap.set("n", "<leader>Y", "gg\"+yG", {desc="yank buffer to clipboard"})

--paste from clipboard
vim.keymap.set("n", "<leader>p", "\"+p", {desc="paste from clipboard"})
vim.keymap.set("x", "<leader>p", "\"+p", {desc="paste from clipboard"})

--when pasting in v-mode, do not override the default register
vim.keymap.set("x", "p", "\"_dP")

--delete to nowhere
vim.keymap.set("n", "<leader>d", "\"_d", {desc="delete to no register"})
vim.keymap.set("v", "<leader>d", "\"_d", {desc="delete to no register"})

--undo only until here
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

-- toggle visibility
vim.keymap.set("n", "<leader>vc", function ()
    vim.wo.conceallevel = (vim.wo.conceallevel == 0) and 2 or 0
  end,
  { desc = "Toggle conceallevel" }
)
vim.keymap.set("n", "<leader>vw", function()
    vim.opt.list = not vim.opt.list:get()
  end,
  { desc = "Toggle invisible character display" }
)

