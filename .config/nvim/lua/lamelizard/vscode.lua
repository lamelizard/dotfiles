-- don't do anything if not embedded into VSCode
if not vim.g.vscode then
  return
end

local vscode = require'vscode'

vim.keymap.set("n", "gr", function() vscode.call('editor.action.goToReferences') end)
-- telescope replacement
vim.keymap.set("n", "<leader>ff", function() vscode.call('workbench.action.quickOpen') end, {desc="find files"})
vim.keymap.set("n", "<leader>fg", function() vscode.call('workbench.action.findInFiles') end, {desc="grep"})
vim.keymap.set("n", "<leader>fls", function() vscode.call('workbench.action.showAllSymbols') end, {desc="lsp symbols (document)"})
vim.keymap.set("n", "<leader>flS", function() vscode.call('workbench.ion.showAllSymbols') end, {desc="lsp symbols (workspace)"})
-- exists?
vim.keymap.set("n", "<leader>flr", function() vscode.call('references-view.findReferences') end, {desc="lsp symbols (document)"})
vim.keymap.set("n", "<leader>fca", function() vscode.call('workbench.action.showCommands') end, {desc="find commands (all)"})
-- lsp replacement
vim.keymap.set("n", "<leader>vd", function() vscode.call('workbench.actions.view.problems') end, {desc="view diagnostics"})
vim.keymap.set("n", "<leader>eca", function() vscode.call('editor.action.refactor') end, {desc="code actions"})
vim.keymap.set("n", "<leader>ef", function() vscode.call('editor.action.formatDocument') end, {desc="format buffer"})
-- workbench.action.terminal.toggleTerminal

