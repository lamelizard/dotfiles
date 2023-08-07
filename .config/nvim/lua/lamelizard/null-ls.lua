local nls = require('null-ls')

local selected_sources = {
  nls.builtins.formatting.shfmt, -- shell script formatting
  nls.builtins.diagnostics.chktex, -- latex linting
}

require('null-ls').setup({
    sources = selected_sources,
})
