vim.keymap.set("n", "<leader>ff", "<Cmd>Files<CR>")
vim.keymap.set("n", "<leader>ffh", "<Cmd>History<CR>")
-- lines in all open buffers
vim.keymap.set("n", "<leader>fl", "<Cmd>Lines<CR>")
vim.keymap.set("n", "<leader>fb", "<Cmd>Buffers<CR>")
-- grep everything - (git)ignore in dir
vim.keymap.set("n", "<leader>fg", "<Cmd>Rg<CR>")
-- only exact matches
vim.keymap.set("n", "<leader>fG", "<Cmd>RG<CR>")
vim.keymap.set("n", "<leader>fW", "<Cmd>Windows<CR>")
-- list of commands, seems broken? (Win 11)
vim.keymap.set("n", "<leader>fca", "<Cmd>Commands<CR>")
vim.keymap.set("n", "<leader>fch", "<Cmd>History:<CR>")
-- list of keymaps
vim.keymap.set("n", "<leader>fkm", "<Cmd>Maps<CR>")
