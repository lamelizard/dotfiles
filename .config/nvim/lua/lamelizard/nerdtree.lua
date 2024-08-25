-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

vim.keymap.set("n", "<leader>fe", ":NERDTreeToggle<CR>", {desc="toggle NERDTree"})

