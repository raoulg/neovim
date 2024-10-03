return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Only load the theme if the file exists
			local theme_file = vim.fn.stdpath("config") .. "/lua/current-theme.lua"
			if vim.fn.filereadable(theme_file) == 1 then
				dofile(theme_file)
			end
		end,
		-- config = function()
		-- 	-- load the colorscheme here
		-- 	vim.cmd([[colorscheme tokyonight]])
		-- end,
	},
	{ "catppuccin/nvim", as = "catppuccin", lazy = true, event = "VeryLazy" },
	{ "navarasu/onedark.nvim", lazy = true, event = "VeryLazy" },
	{ "gbprod/nord.nvim", lazy = true, event = "VeryLazy" },
	{ "Abstract-IDE/Abstract-cs", lazy = true, event = "VeryLazy" },
	{ "EdenEast/nightfox.nvim", lazy = true, event = "VeryLazy" },
	{ "marko-cerovac/material.nvim", lazy = true, event = "VeryLazy" },
	{
		"andrew-george/telescope-themes",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("themes")
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					shortcut = {
						{ desc = "Raoul Grouls", group = "DashboardShortCut" },
					},
					week_header = {
						enable = true,
					},
				},
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				sections = {
					lualine_x = { "aerial" },
				},
			})
		end,
	},
	{
		"nvimdev/indentmini.nvim",
		config = function()
			require("indentmini").setup({
				exclude = {},
			})
		end,
	},
	{
		"adelarsq/image_preview.nvim",
		event = "VeryLazy",
		config = function()
			require("image_preview").setup()
		end,
	},
}
