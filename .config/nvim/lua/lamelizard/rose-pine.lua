-- don't do anything if embedded into VSCode
if vim.g.vscode then
  return
end

require('rose-pine').setup({
  disable_background=true,
  disable_float_background=false,
})

vim.cmd('colorscheme rose-pine')

