-- auto install packer: https://github.com/wbthomason/packer.nvim
local packer_bootstrap = require('lamelizard.packer_install').ensure_packer()
local packer = require('packer')

packer.startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  -- navigation
  use {'junegunn/fzf', run = ":call fzf#install()"}
  use {'junegunn/fzf.vim'}
  -- better search f,t
  use {
    'dahu/vim-fanfingtastic',
    requires = {{'tpope/vim-repeat'}}
  }
  -- snippets
  --use {'SirVer/ultisnips'}
  --use {'honza/vim-snippets'}
  use {'L3MON4D3/LuaSnip'}
  use {'rafamadriz/friendly-snippets'}
  -- latex
  use {'lervag/vimtex',
        config=function() require'lamelizard.vimtex' end,
      }
  -- treesitter
  use {'nvim-treesitter/nvim-treesitter',
        run=':TSUpdate',
        config=function() require'lamelizard.treesitter' end,
      }
  -- better undo
  use {'mbbill/undotree',
        config=function() require'lamelizard.undotree' end,
      }
  -- LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
      {'jose-elias-alvarez/null-ls.nvim', -- many programs wrapped to LSP
        requires={{'nvim-lua/plenary.nvim'}},
        config=function() require'lamelizard.null-ls' end,
      },
      {'williamboman/mason.nvim', -- install LSPs
        config=function() require'lamelizard.mason' end,
      },
		  {'williamboman/mason-lspconfig.nvim',
        requires={'williamboman/mason.nvim'},
        config=function() require'lamelizard.mason-lspconfig' end,
      },
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},
		  {'hrsh7th/cmp-cmdline'},
		  {'saadparwaiz1/cmp_luasnip'},
		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },
    config=function() require'lamelizard.lsp' end,
  }

  -- colorscheme
  use {'rose-pine/neovim',
	  as='rose-pine',
    config=function() require'lamelizard.rose-pine' end,
  }
  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    --requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config=function() require'lamelizard.lualine' end,
  }

  -- sync all after auto install
  if packer_bootstrap then
    packer.sync()
  end
end)

-- autocompile on change
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

