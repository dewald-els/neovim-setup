require("nvim-treesitter.configs").setup({
	ensure_installed = { 
		"typescript",
		"tsx",
		"javascript", 
		"lua",
		"json",
		"html",
		"css",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlight = false
	},
})
