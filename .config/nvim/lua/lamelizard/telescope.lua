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

vim.keymap.set("n", "<leader>ff", function() builtin.find_files{hidden=true} end)
vim.keymap.set("n", "<leader>ffh", builtin.oldfiles)
-- lines in all open buffers
vim.keymap.set("n", "<leader>fl", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
-- grep everything - rather slow in telescope?
vim.keymap.set("n", "<leader>fg", function() builtin.grep_string{shorten_path=true, word_match="-w", only_sort_text=true, search=''} end)
-- only exact matches
vim.keymap.set("n", "<leader>fG", builtin.live_grep)
vim.keymap.set("n", "<leader>fca", builtin.commands)
vim.keymap.set("n", "<leader>fch", builtin.command_history)
-- list of keymaps
vim.keymap.set("n", "<leader>fkm", builtin.keymaps)
