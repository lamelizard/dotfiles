
-- override Trouble's default color scheme to get transparency
vim.api.nvim_set_hl(0, 'TroubleNormal', {link = 'Normal'})
vim.api.nvim_set_hl(0, 'TroubleNormalNC', {link = 'NormalNC'})

require('trouble').setup({
  warn_no_results = false,
  open_no_results = true,
})

vim.keymap.set("n", "<leader>vd",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  {desc="Toggle diagnostics window (current buffer)"}
)

vim.keymap.set("n", "<leader>vD",
  "<cmd>Trouble diagnostics toggle<cr>",
  {desc="Toggle diagnostics window (all files)"}
)

vim.keymap.set("n", "<leader>vs",
  "<cmd>Trouble symbols toggle<cr>",
  {desc="Toggle symbols window"}
)

vim.keymap.set("n", "<leader>vq",
  "<cmd>Trouble quickfix toggle<cr>",
  {desc="Toggle quickfix window"}
)

