local lualine = require('lualine')
return lualine.setup({
  options = {
  icons_enabled = false, -- needs patched font
  --theme = 'auto',
  },
  --extensions = {
  --  'fugitive',
  --  'fzf',
  --},
})
