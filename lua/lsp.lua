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

local has_luasnip, luasnip = pcall(require, 'luasnip')
if not has_luasnip then return end

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
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<CR>"] = cmp.mapping.confirm { select = true },
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
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

lsp.intelephense.setup {
	on_attach = function(client, buffer)
		-- Insert fancy stuff here
	end,
	capabilities = get_capabilities(),
}

lsp.rust_analyzer.setup {
	on_attach = function(client, buffer)
		fmt.on_attach(client, buffer)
	end,
	capabilities = get_capabilities()
}

lsp.denols.setup {
	on_attach = function(client, buffer)
		fmt.on_attach(client, buffer)
	end,
	capabilities = get_capabilities()
}
