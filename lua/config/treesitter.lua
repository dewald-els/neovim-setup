require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "tsx", "javascript", "lua", "json" },
	highlight = {
		enable = true,
		additional_vim_regex_highlight = false
	},
})
