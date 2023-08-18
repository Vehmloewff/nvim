local has_term, term = pcall(require, 'toggleterm.terminal')
if not has_term then return end

local G = {}

local git = term.Terminal:new {
	cmd = 'lazygit',
	direction = 'float'
}

local term1 = term.Terminal:new {
	direction = 'float'
}

local term2 = term.Terminal:new {
	direction = 'float'
}

local term3 = term.Terminal:new {
	direction = 'float'
}

local term4 = term.Terminal:new {
	direction = 'float'
}

function G.toggle_git()
	git:toggle()
end

function G.toggle_term1()
	term1:toggle()
end

function G.toggle_term2()
	term2:toggle()
end

function G.toggle_term3()
	term3:toggle()
end

function G.toggle_term4()
	term4:toggle()
end

return G
