return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })
  use 'shaunsingh/nord.nvim'

  use 'olivercederborg/poimandres.nvim'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

end)
