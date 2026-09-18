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
		vim.api.nvim_create_autocmd('FileType', {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)
				local available = require('nvim-treesitter').get_installed()
				if vim.tbl_contains(available, lang) then
					vim.treesitter.start()
				end
			end,
		})

	end
}
