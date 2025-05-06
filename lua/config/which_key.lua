local which_key = require("which-key")

which_key.setup({
	plugins = {
		spelling = {
			enabled = true
		}
	},
	win = {
		border = "rounded",
	},
	layout = {
		align = "center"
	}
})
