require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {"pyright", "gopls", "tsserver", "clangd"}
}

local on_attach = function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)

	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()


local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.lua_ls.setup{
	on_attach = on_attach,
	capabilities = lsp_capabilities
}

lspconfig.clangd.setup{
	on_attach = on_attach,
	capabilities = lsp_capabilities
}

lspconfig.pyright.setup{
	on_attach = on_attach,
	capabilities = lsp_capabilities
}

lspconfig.tsserver.setup{
	on_attach = on_attach,
	capabilities = lsp_capabilities
}

lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {"gopls"},
	filetypes = { "go", "gomod","gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
}

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	sources = {
		{name = 'pyright'},
		{name = 'nvim_lsp', keyword_length = 1},
		{name = 'buffer', keyword_length = 3},
	},
	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
		['<C-n>'] = cmp.mapping.select_next_item(select_opts),

		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),

		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({select = true}),
	}
})

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = '»'})
