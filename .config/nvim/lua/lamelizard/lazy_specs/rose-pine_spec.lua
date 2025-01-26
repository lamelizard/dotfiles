return {
  -- colorscheme
  'rose-pine/neovim',
  name = 'rose-pine',
  -- make sure to load this first
  lazy = false,
  priority = 1000,
  config = function() require 'lamelizard.rose-pine' end,
}

