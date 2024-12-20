-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("lazy").update({ show = false })
	end,
})

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- install = { colorscheme = { "tokyonight" } },
	checker = { enabled = true },
	vim.keymap.set("n", "<leader>Lu", "<cmd>Lazy<CR>", { noremap = true, silent = true, desc = "Update via Lazy" }),
	vim.keymap.set(
		"n",
		"<leader>Lp",
		"<cmd>Lazy profile<CR>",
		{ noremap = true, silent = true, desc = "Show startup times" }
	),
})
local theme_file = vim.fn.stdpath("config") .. "/lua/current-theme.lua"
if vim.fn.filereadable(theme_file) == 1 then
	dofile(theme_file)
end
