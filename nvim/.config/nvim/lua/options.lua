vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

local o = vim.o
o.tabstop = TAB_WIDTH
o.shiftwidth = TAB_WIDTH
o.textwidth = 0
o.wrapmargin = 0
o.cursorlineopt = "both"
o.showmode = false
o.swapfile = false
o.exrc = true

o.number = true
o.cursorline = true
o.relativenumber = true

vim.wo.wrap = false
vim.g.maplocalleader = "\\"
vim.g.mapleader = " "

local success = pcall(vim.cmd, "colorscheme " .. DEFAULT_COLOR_SCHEME)
if not success then
	print("Couldn't find the target colorscheme")
end

o.background = DEFAULT_BACKGROUND
