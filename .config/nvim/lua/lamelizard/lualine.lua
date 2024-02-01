local lualine = require('lualine')
return lualine.setup({
  options = {
  icons_enabled = false, -- needs patched font
  -- default seperators not available everythere
  section_separators = '',
  component_separators = '',
  --theme = 'auto',
  },
  --extensions = {
  --  'fugitive',
  --  'fzf',
  --},
})
