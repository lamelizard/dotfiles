return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'williamboman/mason.nvim',   -- install LSPs
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    -- latex
    'micangl/cmp-vimtex',
    'kdheepak/cmp-latex-symbols'
    -- snippets
    --'L3MON4D3/LuaSnip',
    --'saadparwaiz1/cmp_luasnip',
    --'rafamadriz/friendly-snippets'
  },
  config = function()
    require 'lamelizard.lsp'
    require 'lamelizard.cmp'
  end,
}

