-- Set some reasonable options
vim.opt.termguicolors = true
vim.opt.cursorline = true -- highlight the current line
vim.opt.cursorlineopt = "line"
vim.opt.number = true -- set numbered lines
vim.opt.rnu = true

-- Require our first modules
require('plugins')
require('keymaps')
require('commands')
require('lsp')
require('terminals')
