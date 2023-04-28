local nls = require('null-ls')

local selected_sources = {
  nls.builtins.formatting.shfmt, -- shell script formatting
}

require('null-ls').setup({
    sources = selected_sources,
})
