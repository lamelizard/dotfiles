return {
  'nvim-treesitter/nvim-treesitter',
  -- take the latest release version
  version = '*',
  build = ':TSUpdate',
  config = function() require 'lamelizard.treesitter' end,
}

