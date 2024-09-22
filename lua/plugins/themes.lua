return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
	},
	{ "folke/tokyonight.nvim", lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,

	},
	{ "catppuccin/nvim", as = "catppuccin", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{ "gbprod/nord.nvim", lazy = false },
	{ "Abstract-IDE/Abstract-cs", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = false },
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
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			scope = { enabled = true },
		},
	},
	{
		"adelarsq/image_preview.nvim",
		event = "VeryLazy",
		config = function()
			require("image_preview").setup()
		end,
	},
}
