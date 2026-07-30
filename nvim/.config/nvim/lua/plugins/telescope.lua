return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
	config = function()
		local module = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", module.find_files)
		vim.keymap.set("n", "<leader>fs", function()
			module.buffers({
				sort_mru = true
			})
		end)
	end
}
