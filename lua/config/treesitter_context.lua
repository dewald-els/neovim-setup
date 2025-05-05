local treesitter_context = require("treesitter-context")

treesitter_context.setup({
	enable = true,
	max_lines = 5,
	time_scope = "outer",
	mode = "cursor",
	separator = nil,
})
