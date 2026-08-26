local set = vim.keymap.set

set("n", "<leader>we", ":aboveleft vsplit<CR>", { desc = "Vertical split", silent = true })
set("n", "<leader>wq", ":belowright split<CR>", { desc = "Horizontal split", silent = true })
set("n", "<leader>/", ":noh<CR>", { desc = "Short for :nohlsearch", silent = true })

set('n', '<leader>k', vim.lsp.buf.definition, { desc = "Go to definition" })

set("n", "<leader>t", "<CMD>Oil<CR>")

set('n', "<leader>r", function()
	vim.diagnostic.open_float({
		border = "rounded",
		style = "minimal",
	}, { focusable = false })
end, { desc = "Show diagnostics", silent = true })

set('n', "<leader>g", function()
	require("conform").format({
		lsp_format = "fallback",
		async = true,
	})
end, { desc = "Format buffer" })

set("n", "gre", function()
	local word = vim.fn.expand("<cword>")
	local replacement = vim.fn.input("Replace " .. word .. " with: ")
	if replacement ~= "" then
		vim.cmd("%s/\\<" .. vim.fn.escape(word, "/\\") .. "\\>/" ..
		vim.fn.escape(replacement, "/\\") .. "/g")
		vim.cmd("nohl")
	end
end, { desc = "Replace word everywhere" })
