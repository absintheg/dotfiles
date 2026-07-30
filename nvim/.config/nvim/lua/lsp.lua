vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.lsp.config("*", {
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
})

vim.diagnostic.config({
	underline = {
		severity = vim.diagnostic.severity.ERROR,
		style = "curly",
	},
	signs = true,
	float = { border = "rounded" },
	update_in_insert = true,
})

vim.lsp.config("rust_analyzer", {
	check = {
		command = "clippy",
	}
})

vim.lsp.enable({
	"rust_analyzer",
	"clangd"
})
