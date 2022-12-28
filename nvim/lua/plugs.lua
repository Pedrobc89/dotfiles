return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Awesome syntax highlither
  use 'sheerun/vim-polyglot' 

  -- Git for the win
  use 'tpope/vim-fugitive'

  -- add surroundings like a boss
  use 'tpope/vim-surround'

  -- best colorschemes ever
  use 'chriskempson/base16-vim'

  -- Language Server Protocol support
  use 'neovim/nvim-lspconfig'
  -- LSP UI improovements
  use 'glepnir/lspsaga.nvim'

  -- File tree
  use 'scrooloose/nerdtree'

  -- Comment tool
  use 'scrooloose/nerdcommenter'

  -- Navigate between tmux and nvim/vim panes and windows
  use 'christoomey/vim-tmux-navigator'

  -- Syntax highlighter with treesitter code parse
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
end)
