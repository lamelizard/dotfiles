return {
  'folke/snacks.nvim',
  -- start early
  priority = 1000,
  lazy = false,
  config = function() require 'lamelizard.snacks' end,
}

