vim.cmd.command 'Reload source ~/.config/nvim/init.vim | lua print "Reloaded!"'

vim.api.nvim_create_user_command('Q', function()
	while true
	do
		vim.cmd "q"
	end
end, {})

