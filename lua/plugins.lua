local function setup(name)
	local hasMod, mod = pcall(require, name)	
	
	return function(arg)
		if hasMod then mod.setup(arg) end
	end
end

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
	use 'lewis6991/gitsigns.nvim'
	use 'gelguy/wilder.nvim'
end)

-- Setup the file explorer
setup 'carbon' {
	auto_open = false,
	open_on_dir = false,
	sync_pwd = false,
	sidebar_width = 40,
}
-- ... then open it if it isn't already open
vim.cmd 'Lcarbon!'

-- Setup the theme
setup 'catppuccin' {
	flavour = 'mocha',
}

vim.cmd.colorscheme 'catppuccin'

-- Setup our tabs at the top
setup 'bufferline' {
	options = {
		offsets = {
			filetype = 'carbon.explorer',
		}
	}
}

-- Setup that fancy status line at the bottom of the screen
setup 'lualine' {}

-- Setup those fancy web-dev-icons
setup 'nvim-web-devicons' {}

-- Setup better terminal control
setup 'toggleterm' {}

-- Setup git integration
setup 'gitsigns' {}

-- Command autocomplete
setup 'wilder' {
	modes = {':', '/', '?'}
}

local hasWilder, wilder = pcall(require, 'wilder')
if hasWilder then
	wilder.set_option('renderer', wilder.popupmenu_renderer({
		-- highlighter applies highlighting to the candidates
		highlighter = wilder.basic_highlighter(),
	}))
end

