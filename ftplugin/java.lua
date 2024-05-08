local config = {
    cmd = {'/opt/homebrew/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

local indent = 4
vim.o.smartindent = true
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.shiftwidth = indent
