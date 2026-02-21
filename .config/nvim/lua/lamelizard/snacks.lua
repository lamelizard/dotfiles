-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

local file_exclusions = {
  -- directories
  ".git",
  ".idea",
  -- binary
  ".gz",
  ".jpg",
  ".pdf",
  ".png",
  ".zip",
  -- latex
  ".acn",
  ".aux",
  ".glo",
  ".idx",
  ".ilg",
  ".iml",
  ".ind",
  ".out",
  ".synctex",
  ".toc",
  ".xdy",
  ".xmpi",
}

local snacks = require('snacks')
snacks.setup{
  ---@type snacks.Config
  opts = {
    picker = {
      exclude = file_exclusions,
    },
  }
}

-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
vim.keymap.set("n", "<leader>ff", function() snacks.picker.files({hidden=true}) end, {desc="find files"})
-- lines in all open buffers
vim.keymap.set("n", "<leader>fL", snacks.picker.grep_buffers, {desc="find lines in buffers"})
vim.keymap.set("n", "<leader>fb", snacks.picker.buffers, {desc="find buffers"})
-- grep everything - rather slow in telescope?
vim.keymap.set("n", "<leader>fg", function() snacks.picker.grep() end, {desc="grep"})
-- only exact matches
vim.keymap.set("n", "<leader>fG", function() snacks.picker.grep({args={"-w"}}) end, {desc="grep (exact matches)"})
-- lsp
vim.keymap.set("n", "<leader>fls", snacks.picker.lsp_symbols, {desc="lsp symbols (document)"})
-- builtin.lsp_dynamic_workspace_symbols?
vim.keymap.set("n", "<leader>flS", snacks.picker.lsp_workspace_symbols, {desc="lsp symbols (workspace)"})
vim.keymap.set("n", "<leader>flr", snacks.picker.lsp_references, {desc="lsp references"})
vim.keymap.set("n", "<leader>fld", snacks.picker.lsp_definitions, {desc="lsp definitions"})
vim.keymap.set("n", "<leader>flI", snacks.picker.lsp_implementations, {desc="lsp implementations"})
vim.keymap.set("n", "<leader>flt", snacks.picker.lsp_type_definitions, {desc="lsp type definitions"})
vim.keymap.set("n", "<leader>flci", snacks.picker.lsp_incoming_calls, {desc="lsp incoming calls"})
vim.keymap.set("n", "<leader>flco", snacks.picker.lsp_outgoing_calls, {desc="lsp outgoing calls"})

vim.keymap.set("n", "<leader>fca", snacks.picker.commands, {desc="find commands (all)"})
vim.keymap.set("n", "<leader>fch", snacks.picker.command_history, {desc="find commands (history)"})
-- list of keymaps
vim.keymap.set("n", "<leader>fkm", snacks.picker.keymaps, {desc="find keymaps"})
