require('packer').init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end,
	},
}

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'SidOfc/carbon.nvim'

	use 'nvim-tree/nvim-web-devicons'

	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'

	use 'nvim-lualine/lualine.nvim'
	use 'catppuccin/nvim'

	use 'akinsho/bufferline.nvim'
	use 'akinsho/toggleterm.nvim'
end)

-- Setup the file explorer
require('carbon').setup {
	auto_open = false,
	open_on_dir = false,
	sync_pwd = false,
	sidebar_width = 40,
}
-- ... then open it if it isn't already open
vim.cmd 'Lcarbon!'

-- Setup our tabs at the top
require('bufferline').setup {
	options = {
		offsets = {
			filetype = 'carbon.explorer',
		}
	}
}

-- Setup the theme
require('catppuccin').setup {
	flavour = 'mocha',
}

vim.cmd.colorscheme 'catppuccin'

-- Setup that fancy status line at the bottom of the screen
require('lualine').setup {}

-- Setup those fancy web-dev-icons
require('nvim-web-devicons').setup {}

-- Setup better terminal control
require('toggleterm').setup {

}

