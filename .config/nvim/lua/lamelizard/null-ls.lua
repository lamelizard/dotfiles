local nls = require('null-ls')

local selected_sources = {
  nls.builtins.formatting.shfmt, -- shell script formatting
  --got deprecated...
  --https://github.com/nvimtools/none-ls.nvim/issues/58
  --nls.builtins.diagnostics.chktex, -- latex linting
}

require('null-ls').setup({
    sources = selected_sources,
})
