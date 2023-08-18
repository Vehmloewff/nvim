local keymap = vim.keymap.set
local opts = { silent = false }

local function add_telescope_bindings()
	local hasTelescope, telescope = pcall(require, 'telescope.builtin')
	if not hasTelescope then return end

	keymap("n", "<Leader>ff", telescope.find_files, opts) -- Open the find file floating window
	keymap('n', '<leader>fg', telescope.live_grep, opts) -- Open the find item floating window
	keymap('n', '<leader>fb', telescope.buffers, opts)
	keymap('n', '<leader>fh', telescope.help_tags, opts)
end

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Custom Shortcuts
add_telescope_bindings()
keymap("n", "<Leader>e", function() vim.cmd "Lcarbon!" end, opts)              -- Open (or focus) the file explorer sidebar
keymap('n', '<Leader>E', function() vim.cmd "Fcarbon" end, opts)               -- Open the file explorer as a floating window
keymap('n', '<Leader>h', function() vim.cmd 'bprev' end, opts)                 -- Go to the last buffer
keymap('n', '<Leader>l', function() vim.cmd 'bnext' end, opts)                 -- Go to the next buffer
keymap('n', '<Leader>s', function() vim.cmd 'w' end, opts)                     -- Save the current buffer
keymap('n', '<Leader>S', function() vim.cmd 'w | bp | sp | bn | bd' end, opts) -- Save the current buffer and close it
keymap('n', '<Leader>n', 'i<cr><Esc>', opts)                                   -- Insert a newline where the cursor is

-- Overwritten shortcuts
keymap('n', 'o', 'o<Esc>0"_D', opts)
keymap('n', 'O', 'O<Esc>0"_D', opts)

-- Insert Shortcuts
keymap("i", "<Enter>", "<ESC>", opts)

-- Terminal Shortcuts
local terms = require('terminals')
keymap('n', '<Leader>g', function() terms.toggle_git() end, opts)    -- Toggle lazygit
keymap('n', '<Leader>t1', function() terms.toggle_term1() end, opts) -- Toggle the terminal
keymap('n', '<Leader>t2', function() terms.toggle_term2() end, opts) -- Toggle the terminal
keymap('n', '<Leader>t3', function() terms.toggle_term3() end, opts) -- Toggle the terminal
keymap('n', '<Leader>t4', function() terms.toggle_term4() end, opts) -- Toggle the terminal

function _G.set_terminal_keymaps()
	local opts =
		vim.keymap.set('t', '<Esc>', '<C-\\><C-n><C-w>p', { buffer = 0 })
end

-- For some reason this causes the keystrokes to not be consumed by the terminal
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
