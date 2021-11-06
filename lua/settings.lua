local utils = require('utils')

local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'

utils.opt('o', 'hidden', true)
utils.opt('o', 'smarttab', true)
utils.opt('o', 'expandtab', true)
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
utils.opt('o', 'shortmess', 'filnxtToOFc')
utils.opt('o', 'timeoutlen', 500)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'guifont', 'Jetbrains Mono:h17')
utils.opt('o', 'autoread', true)
-- 

utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'signcolumn', 'yes')
utils.opt('w', 'foldtext', [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']])

utils.opt('w', 'foldexpr', "nvim_treesitter#foldexpr()")
utils.opt('w', 'foldnestmax', 9)


utils.opt('b', 'autoindent', true)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'softtabstop', indent)
utils.opt('b', 'shiftwidth', indent)

utils.opt('b', 'swapfile', false)

