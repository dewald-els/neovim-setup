local lspconfig = require("lspconfig")
local lsp_signature = require("lsp_signature")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = {"vim"}
			}
		}
	}
})

lspconfig.ts_ls.setup({
	on_attach = function(_, bufnr)
		print("TypeScript LSP attached to buffer", bufnr)
	end,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterHints = "all",
				includeInlayVariableTypeHints = true
			}
		}
	}
})

lsp_signature.setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
	hint_enable = true,
	hint_prefix = "? ",
	floating_window = true,
	floating_window_above_cur_line = true,
})

lspconfig.tailwindcss.setup({
	on_attach = function(client, bufnr)
		-- Optional: attach signature plugin
	end,
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"tsx",
	}
})

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	})
})
