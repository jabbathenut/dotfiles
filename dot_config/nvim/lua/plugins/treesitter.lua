return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {},
	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.setup({})
		treesitter.install({
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"html",
			"javascript",
			"json",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"scss",
			"svelte",
			"tsx",
			"typst",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
			"zsh",
		})
	end,
}
