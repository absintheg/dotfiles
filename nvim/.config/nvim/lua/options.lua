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

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
	vim.o.guifont = "JetBrainsMonoNL Nerd Font:h11"
	vim.opt.linespace = -2

	vim.g.neovide_title_text_color = "pink"
	vim.g.neovide_title_background_color = string.format(
		"%x",
		vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
	)

	vim.g.neovide_theme = 'auto'
	vim.g.neovide_cursor_animation_length = 0.02
end

local success = pcall(vim.cmd, "colorscheme " .. DEFAULT_COLOR_SCHEME)
if not success then
	print("Couldn't find the target colorscheme")
end

local function update_background()
	local handle = io.popen("kreadconfig6 --file kdeglobals --group General --key ColorScheme")
	local scheme = handle:read("*a")
	handle:close()

	if #scheme > 0 then
		o.background = scheme:find("Light") and "light" or "dark"
	else
		o.background = DEFAULT_BACKGROUND
	end
end

vim.api.nvim_create_user_command("UpdBg", function()
	update_background()
end, {})

update_background()
