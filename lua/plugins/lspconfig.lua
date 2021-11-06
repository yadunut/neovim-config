local lsp = require 'lspconfig'
local utils = require 'utils'
local coq = require 'coq'

local root_pattern = require 'lspconfig/util'.root_pattern


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(_, buffer) 

  utils.opt('w', 'foldmethod', 'expr')
  utils.opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')
  utils.opt('w', 'foldenable', false)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(buffer, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(buffer, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>', opts)
end
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}
local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true,
}

lsp.beancount.setup {
  cmd = { "beancount-langserver", "--stdio" },
  init_options = {
    journalFile = "/home/yadunut/Documents/Important/Accounting/yadunut.beancount",
    pythonPath = "/usr/bin/python3",
  },
  on_attach = on_attach
}

lsp.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }
lsp.dartls.setup { on_attach = on_attach, capabilities = capabilities }

lsp.clangd.setup { on_attach = on_attach, capabilities = capabilities }

lsp.elmls.setup { on_attach = on_attach, capabilities = capabilities }

lsp.denols.setup {
  -- filetypes = { "typescript" },
  init_options = {
    enabled = true,
    lint = true,
  },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = root_pattern("deno.json"),
}


--[[
lsp.tsserver.setup(coq.lsp_ensure_capabilities({ 
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
    vim.cmd("COQnow")
  end
}))
--]]
lsp.tsserver.setup { 
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  capabilities = capabilities,
  root_dir = function(fname)
    return root_pattern 'tsconfig.json'(fname)
        or root_pattern('package.json', 'jsconfig.json')(fname)
  end
}
lsp.efm.setup { 
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    on_attach(client)
  end,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      typescript = {eslint},
      javascript = {eslint},
      typescriptreact = {eslint},
      javascriptreact = {eslint},
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
  capabilities = capabilities,

  root_dir = function(fname)
    return root_pattern 'tsconfig.json'(fname)
        or root_pattern('package.json', 'jsconfig.json')(fname)
  end
}
