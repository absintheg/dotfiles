return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require("nvim-treesitter").install({
			"lua",
			"vim",
			"bash",
			"zsh",
			"json",
			"markdown",
			"rust",
			"c",
			"cpp",
			"gitignore"
		})
	end
}
