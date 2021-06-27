require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- LSP and completion
	use { 'neovim/nvim-lspconfig' }
	use { 'nvim-lua/completion-nvim' }
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'dracula/vim'

	use 'nvim-treesitter/nvim-treesitter'
	use 'windwp/nvim-ts-autotag'
	
	use 'tjdevries/nlua.nvim'
end)

require('plugins.nlua')
require('plugins.telescope')
require('plugins.lspconfig')
require('plugins.nvim-treesitter')
