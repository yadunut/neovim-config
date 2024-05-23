vim.g.mapleader = ' '
-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

-- Install plugins
require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  -- NVIM CMP
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path' }

  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'nvimtools/none-ls.nvim' }
  use { 'ray-x/lsp_signature.nvim' }

  use { 'mfussenegger/nvim-jdtls' }

  -- TELESCOPE
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' }, 
      { 'nvim-lua/plenary.nvim'},
    }
  }
  use { 'ahmedkhalf/project.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'debugloop/telescope-undo.nvim' }

  -- TREESITTER
  use { 'nvim-treesitter/nvim-treesitter', run= ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-context' } 
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'windwp/nvim-ts-autotag' }

  use {'kaarmu/typst.vim', ft = {'typst'}}

  use { 'zbirenbaum/copilot.lua',
    config = function()
      -- require("copilot").setup({
      --   suggestion = { enabled = false },
      --   panel = { enabled = false },
      -- })
    end 
  }
  use { 'zbirenbaum/copilot-cmp', 
    after = { "copilot.lua" },
    config = function()
      -- require("copilot_cmp").setup()
    end
  }


  -- Quickfix
  use { 'kevinhwang91/nvim-bqf' }
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }


  -- Helpers
  use { "folke/which-key.nvim", config = function() require('which-key').setup {} end }
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- Editor 
  use { "numToStr/Comment.nvim", config = function() require('Comment').setup() end }
  use { 'tpope/vim-surround' }
  use { 'phaazon/hop.nvim', branch = 'v2' }

  use { 'ellisonleao/gruvbox.nvim' }

  use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim' }


  use { 
    'f3fora/nvim-texlabconfig', 
    config = function() require('texlabconfig').setup(config) end, 
    run = 'go build' 
  }

  use {'nvim-orgmode/orgmode' }
  use { 'michaelb/sniprun', run = 'sh ./install.sh'}

  use { 'ray-x/go.nvim' }
  use {'ray-x/guihua.lua'  } -- recommended if need floating window support



end)

-- which key
local wk = require("which-key")
wk.setup {}

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldnestmax = 9
vim.wo.foldlevel = 9
vim.wo.breakindent = true
vim.opt.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]
vim.o.completeopt = 'menuone,noinsert,noselect' -- Might have to remove noinsert

vim.o.expandtab = true
vim.o.shortmess = 'filnxtToOFc'
vim.o.timeoutlen = 500
vim.o.guifont = 'JetbrainsMono Nerd Font:h13'

vim.o.swapfile = false

local indent = 2
vim.o.smartindent = true
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.shiftwidth = indent

vim.o.conceallevel = 2
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', ';', ':')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- project.nvim
require("project_nvim").setup {
  silent_chdir = false,
  detection_methods = { "pattern",  },
  patterns = { "go.work", "go.mod", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "dune-project" },

}

-- Telescope
require('telescope').setup {
  defaults = { 
    mappings = { 
      i = { ["<esc>"] = require('telescope.actions').close } 
    } 
  }
}

require('telescope').load_extension('projects')
require('telescope').load_extension('fzf')
require('telescope').load_extension('undo')

wk.register({
  ["<leader>"] = { require('telescope.builtin').find_files, "Find File" },
  f = {
    name = "+Telescope",
    b = { require('telescope.builtin').buffers, "Buffers" },
    g = { require('telescope.builtin').live_grep, "Grep" },
    p = { require('telescope').extensions.projects.projects, "Projects" },
  },
  u = { require('telescope').extensions.undo.undo, "Undo" },
}, { prefix = "<leader>" })

-- TREESITTER
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
    disable = { "latex" },
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    }
  }
}

-- Diagnostics keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)





-- nvim-cmp

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require('luasnip')
require("luasnip.loaders.from_snipmate").lazy_load()

local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      print('trying to expand')
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'orgmode' },
      { name = "copilot", group_index = 2 },
    },
    {
      { name = 'path' },
    }),
  completion = {
    keyword_length = 2,
  },

}

-- Golang Settings

-- LSP Settings

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
  local opts = { silent = true, buffer=ev.buf }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts) -- experimental
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
  vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format {async = true } end, {})

  end
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false


local lspconfig = require('lspconfig')
local on_attach = function(_, bufnr)
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  vim.wo.foldenable = true

  require "lsp_signature".on_attach {
    bind = true,
    floating_window_above_cur_line = false,
  }
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- enable servers
local servers = { 'rust_analyzer', 'svelte', 'elmls', 'dartls', 'ocamllsp', 'zls', 'pyright', 'clangd', 'gopls', "nil_ls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.biome.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = true
    on_attach(client)
  end,
  capabilities = capabilities,
}

require'lspconfig'.typst_lsp.setup{
	settings = {
		exportPdf = "onSave" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
	}
}





lspconfig.denols.setup {
  on_attach = on_attach, 
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    if lspconfig.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) then
      client.stop()
      return
    end
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client)
  end,
  capabilities = capabilities,
}


-- local null_ls = require 'null-ls'
-- null_ls.setup { 
--   sources = {
--     null_ls.builtins.formatting.black,
--   },
--   root_dir = function() return nil end,
--   on_attach = function(client)
--     client.server_capabilities.documentFormattingProvider = true
--     client.server_capabilities.goto_definition = false
--     on_attach(client)
--   end,
--   should_attach = function(bufnr)
--     return not require("null-ls.utils").root_pattern('rome.json', "deno.json", "deno.jsonc")(vim.api.nvim_buf_get_name(bufnr))
--   end,
--   capabilities = capabilities,
-- }

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    texlab = {
      build = {
        executable = "tectonic",
        args = {
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates",
          "-Z",
          "shell-escape"
        },
        onSave = true,
        forwardSearchAfter = true,
      },
      forwardSearch = {
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args = { "-g", "%l", "%p", "%f" },
      },
    }
  }
}
-- Go Setup

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup()



-- nvim-tree
require('nvim-tree').setup {
  update_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  view = {
    side = "right",
  }
}
vim.keymap.set('n', '<leader>tt', require('nvim-tree.api').tree.toggle)

-- Trouble
require("trouble").setup { }
vim.keymap.set('n', '<leader>tr', require('trouble').toggle)

-- Hop.nvim
local hop = require('hop')
hop.setup {}
wk.register({
  ["<leader>h"] = { name ="+hop" },
  ["<leader>hw"] = { function() require('hop').hint_words() end, "Hop Word" },
  ["<leader>hp"] = { function() require('hop').hint_patterns() end, "Hop Pattern" },
  ["<leader>ha"] = { function() require('hop').hint_anywhere() end, "Hop Pattern" },
  ["<leader>hc"] = { function() require('hop').hint_chars() end, "Hop Pattern" },
})

-- Neogit
require('neogit').setup {}

vim.keymap.set('n', '<leader>gg', require('neogit').open)

-- org mode
require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_agenda_files = {'~/Documents/org/roam/*'},
  org_default_notes_file = '~/Documents/org/refile.org',
  org_startup_indented = "true"
})




function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

if vim.fn.has('gui_vimr') == 1 then
end
