local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- LSP and completion
  use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one

  use { 
    'hrsh7th/nvim-cmp', 
    config = function() require('plugins.nvim-cmp') end,
    requires = {
      {'hrsh7th/cmp-nvim-lua'}, 
      {'hrsh7th/cmp-nvim-lsp'}, 
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-vsnip'},
      {'hrsh7th/vim-vsnip'},
    }
  }

  use { 
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end
  }
  use {
    'dracula/vim',
    config = function() vim.cmd('colorscheme dracula') end
  }


  use 'tanvirtin/monokai.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.nvim-treesitter') end
  }
  use 'windwp/nvim-ts-autotag'

  use {
    'tjdevries/nlua.nvim',
    after = {'nvim-lspconfig'},
    config = function() require('plugins.nlua') end
  }
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
      require("trouble").setup { }
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() 

      vim.g.nvim_tree_respect_buf_cwd = 1
      require'nvim-tree'.setup {
        auto_close = true,
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true
        },
      }
      require('utils').map('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
    end
}

  use { 
    "ahmedkhalf/project.nvim",
    config = function() 
      require("project_nvim").setup {
        silent_chdir = false,
      }
      require('telescope').load_extension('projects')
    end
  }

  use "tpope/vim-commentary"
end)
