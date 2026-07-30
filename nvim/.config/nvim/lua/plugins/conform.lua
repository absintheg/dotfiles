return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			nix = { "nixfmt" },
		},
	},
}
