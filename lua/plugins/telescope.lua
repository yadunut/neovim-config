local utils = require('utils')

utils.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
utils.map('n', '<leader><leader>', '<cmd>Telescope find_files<cr>')
utils.map('n', '<leader>rg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
utils.map('n', '<leader>fp', '<cmd>Telescope projects<cr>')
utils.map('n', '<leader>pp', '<cmd>Telescope projects<cr>')

local actions = require('telescope.actions')
require('telescope').setup { 
  defaults = { 
    mappings = { 
      i = { ["<esc>"] = actions.close } 
    } 
  }
}
