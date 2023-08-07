if vim.g.neovide then
  -- set neovide_transparency to 0.0 if using vim background
  vim.g.neovide_transparency=0.9  
  
  --vim.o.guifont = "Source Code Pro:h14"
  
  vim.keymap.set("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>")
  
  --doesn't work?
  -- Ctrl+ and Ctrl- to change scale
  --vim.g.neovide_scale_factor = 1.0
  --local change_scale_factor = function(delta)
  --  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  --end
  --vim.keymap.set("n", "<C-+>", function()
  --  change_scale_factor(1.25)
  --end)
  --vim.keymap.set("n", "<C-->", function()
  --  change_scale_factor(1/1.25)
  --end)
end