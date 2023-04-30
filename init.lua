return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup{}

  use 'mhartington/formatter.nvim'
  use 'HerringtonDarkholme/yats.vim'
  use 'maxmellon/vim-jsx-pretty'

  use 'terrortylor/nvim-comment'
  require('nvim_comment').setup()

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

  require('basics')
  require('colors')
  require('lsp')
  require('telescope-config')
  require('formatter-config')
end)
