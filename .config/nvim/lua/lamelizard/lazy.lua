-- auto install lazy: https://lazy.folke.io/installation
local lazy_bootstrap = require('lamelizard.lazy_install').ensure_lazy()
-- make sure to setup leader keys before this
local lazy = require('lazy')

lazy.setup({
  spec = {
    -- import plugin specs
    { import = 'lamelizard.lazy_specs' },
  },
  install = {
    colorscheme = { "rose-pine" },
  },
  -- auto check for plugin updates
  checker = {
    enabled = false,
  },
})
