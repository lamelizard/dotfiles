return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function() require 'lamelizard.treesitter' end,
}

