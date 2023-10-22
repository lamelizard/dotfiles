vim.keymap.set("n", "<leader>ff", "<Cmd>Files<CR>", {desc="find files"})
vim.keymap.set("n", "<leader>ffh", "<Cmd>History<CR>", {desc="find files (history)"})
-- lines in all open buffers
vim.keymap.set("n", "<leader>fl", "<Cmd>Lines<CR>", {desc="find lines (in open buffers)"})
vim.keymap.set("n", "<leader>fb", "<Cmd>Buffers<CR>", {desc="find buffers"})
-- grep everything - (git)ignore in dir
vim.keymap.set("n", "<leader>fg", "<Cmd>Rg<CR>", {desc="grep"})
-- only exact matches
vim.keymap.set("n", "<leader>fG", "<Cmd>RG<CR>", {desc="grep (exact matches)"})
vim.keymap.set("n", "<leader>fW", "<Cmd>Windows<CR>", {desc="find windows"})
-- list of commands, seems broken? (Win 11)
vim.keymap.set("n", "<leader>fca", "<Cmd>Commands<CR>", {desc="find commands (all)"})
vim.keymap.set("n", "<leader>fch", "<Cmd>History:<CR>", {desc="find commands (history)"})
-- list of keymaps
vim.keymap.set("n", "<leader>fkm", "<Cmd>Maps<CR>", {desc="find keymaps"})
