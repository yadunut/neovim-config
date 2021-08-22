local use = require('packer').use

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	-- LSP and completion
	use { 
		'neovim/nvim-lspconfig',
		config = function() require('plugins.lspconfig') end,
	}

	use { 'hrsh7th/nvim-compe' }
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'dracula/vim'

	use 'nvim-treesitter/nvim-treesitter'
	use 'windwp/nvim-ts-autotag'

	use 'tjdevries/nlua.nvim'
	use { 
		'kristijanhusak/orgmode.nvim', 
		config = function() 
			require('orgmode').setup({
				org_agenda_files = {'~/org/*'},
				org_default_notes_file = '~/org/inbox.org',
			})
		end
	}
	use {
		"folke/which-key.nvim",
		config = function() require("which-key").setup {} end
	}

	use {
		"kevinhwang91/nvim-bqf"
	}

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require('utils').map('n', '<leader>tr', '<cmd>TroubleToggle<cr>')
			require("trouble").setup {
			}
		end
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('utils').map('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
		end
	}
end)

require('plugins.nlua')
require('plugins.telescope')
require('plugins.nvim-compe')
require('plugins.nvim-treesitter')
