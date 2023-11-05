-- auto install packer: https://github.com/wbthomason/packer.nvim
local packer_bootstrap = require('lamelizard.packer_install').ensure_packer()
local packer = require('packer')

packer.startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  -- navigation
  -- fzf still runs commands in WSL every time (slow!)
  -- https://github.com/junegunn/fzf.vim/issues/1457
  --use {'junegunn/fzf', run = ":call fzf#install()"}
  --use {'junegunn/fzf.vim',
  --  config=function() require'lamelizard.fzf' end,
  --}
  use{'nvim-telescope/telescope.nvim',
    -- update periodically, but use tag to get a stable version
    tag = '0.1.2',
    requires = {{'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim',
      --warning: does not throw error if it fails,
      --additionally, it does not seem to work?
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && '..
            'cmake --build build --config Release && '..
            'cmake --install build --prefix build'
    }},
    config=function() require'lamelizard.telescope' end,
  }
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
  -- git diff markers
  --use {'airblade/vim-gitgutter'}
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
		  {'hrsh7th/nvim-cmp',
        requires={
		      {'hrsh7th/cmp-buffer'},
		      {'hrsh7th/cmp-path'},
		      {'hrsh7th/cmp-nvim-lsp'},
		      {'hrsh7th/cmp-nvim-lua'},
		      {'hrsh7th/cmp-cmdline'},
          -- Latex
          --{'micangl/cmp-vimtex'},
          {'kdheepak/cmp-latex-symbols'},
		      -- Snippets
		      {'saadparwaiz1/cmp_luasnip'},
		      {'L3MON4D3/LuaSnip'},
		      {'rafamadriz/friendly-snippets'},
        },
      },
	  },
    config=function()
      require'lamelizard.lsp'
      require'lamelizard.cmp'
    end,
  }

  use {'folke/which-key.nvim',
    config=function() require'lamelizard.which-key' end,
  }

  -- higlight occurances of word under cursor
  --use {'RRethy/vim-illuminate'}
  -- show registers using ""
  use {'gennaro-tedesco/nvim-peekup'}

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

