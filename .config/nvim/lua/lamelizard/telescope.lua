-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

local telescope = require('telescope')
telescope.setup{
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}
telescope.load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", function() builtin.find_files{hidden=true} end, {desc="find files"})
vim.keymap.set("n", "<leader>fhf", builtin.oldfiles, {desc="find files (history)"})
-- lines in all open buffers
vim.keymap.set("n", "<leader>fL", builtin.current_buffer_fuzzy_find, {desc="find lines in buffers"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc="find buffers"})
-- grep everything - rather slow in telescope?
vim.keymap.set("n", "<leader>fg", function() builtin.grep_string{shorten_path=true, word_match="-w", only_sort_text=true, search=''} end, {desc="grep"})
-- only exact matches
vim.keymap.set("n", "<leader>fG", builtin.live_grep, {desc="grep (exact matches)"})
-- lsp
vim.keymap.set("n", "<leader>fls", builtin.lsp_document_symbols, {desc="lsp symbols (document)"})
-- builtin.lsp_dynamic_workspace_symbols?
vim.keymap.set("n", "<leader>flS", builtin.lsp_workspace_symbols, {desc="lsp symbols (workspace)"})
vim.keymap.set("n", "<leader>flr", builtin.lsp_references, {desc="lsp references"})
vim.keymap.set("n", "<leader>fld", builtin.lsp_definitions, {desc="lsp definitions"})
vim.keymap.set("n", "<leader>flI", builtin.lsp_implementations, {desc="lsp implementations"})
vim.keymap.set("n", "<leader>flt", builtin.lsp_type_definitions, {desc="lsp type definitions"})
vim.keymap.set("n", "<leader>flci", builtin.lsp_incoming_calls, {desc="lsp incoming calls"})
vim.keymap.set("n", "<leader>flco", builtin.lsp_outgoing_calls, {desc="lsp outgoing calls"})

vim.keymap.set("n", "<leader>fca", builtin.commands, {desc="find commands (all)"})
vim.keymap.set("n", "<leader>fch", builtin.command_history, {desc="find commands (history)"})
-- list of keymaps
vim.keymap.set("n", "<leader>fkm", builtin.keymaps, {desc="find keymaps"})
