vim.api.nvim_create_user_command('Reload', function()
	vim.cmd.source '~/.config/nvim/init.vim'
	print 'Reloaded!'
end, {})

vim.api.nvim_create_user_command('Q', function()
	while true
	do
		vim.cmd "q"
	end
end, {})

vim.api.nvim_create_autocmd('SaveOnBlur', {
	command = 'w',
	group = vim.api.nvim_create_autogroup(),
})

