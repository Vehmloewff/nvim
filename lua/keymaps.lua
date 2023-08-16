local keymap = vim.keymap.set
local opts = { silent = false }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Custom Shortcuts
keymap("n", "<Leader>ff", require('telescope.builtin').find_files, opts)
keymap("n", "<Leader>e", function() vim.cmd "Lcarbon!" end, opts)
keymap('n', '<Leader>E', function() vim.cmd "Fcarbon" end, opts)
keymap('n', '<Leader>h', function() vim.cmd 'bprev' end, opts)
keymap('n', '<Leader>l', function() vim.cmd 'bnext' end, opts)
keymap('n', 'o', 'o<Esc>0"_D', opts)
keymap('n', 'O', 'O<Esc>0"_D', opts)
keymap('n', '<Leader>s', function() vim.cmd 'w' end, opts)
keymap('n', '<Leader>S', function() vim.cmd 'w | q' end, opts)

-- Insert Shortcuts
keymap("i", "<Enter>", "<ESC>", opts)

