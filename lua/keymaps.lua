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
-- Save the current buffer
keymap('n', '<Leader>s', function() vim.cmd 'w' end, opts)
-- Save the current buffer and close it without messing up any other sidebars
keymap('n', '<Leader>S', function()
	local buf = vim.api.nvim_win_get_buf(0)

	if not vim.bo[buf].readonly then
		vim.cmd 'w'
	end

	vim.cmd 'bp | sp | bn | bd'
end, opts)
-- Insert a newline where the cursor is
keymap('n', '<Leader>n', 'i<cr><Esc>', opts)

-- Overwritten shortcuts
keymap('n', 'o', 'o<Esc>0"_D', opts)
keymap('n', 'O', 'O<Esc>0"_D', opts)

-- Insert Shortcuts
keymap("i", "<Enter>", "<ESC>", opts)

