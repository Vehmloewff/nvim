local has_lsp, lsp = pcall(require, 'lspconfig')
if not has_lsp then return end

local has_mason_lsp, mason_lsp = pcall(require, 'mason-lspconfig')
if not has_mason_lsp then return end

local has_mason, mason = pcall(require, 'mason')
if not has_mason then return end

local has_fmt, fmt = pcall(require, 'lsp-format')
if not has_fmt then return end

local has_cmp, cmp = pcall(require, 'cmp')
if not has_cmp then return end

local servers = {
	'intelephense',
	'lua_ls',
	'rust_analyzer',
	'denols',
}

mason.setup {}
fmt.setup {}

mason_lsp.setup {
	ensure_installed = servers
}

cmp.setup {
	sources = {
		{ name = 'nvim_lsp' }
	},
}

local function get_capabilities()
	local has_nvim_lsp, nvim_lsp = pcall(require, 'cmp_nvim_lsp')
	if not has_nvim_lsp then return {} end

	return nvim_lsp.default_capabilities()
end

lsp.lua_ls.setup {
	on_attach = function(client, buffer)
		fmt.on_attach(client, buffer)
	end,
	capabilities = get_capabilities()
}
