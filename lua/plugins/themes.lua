return {
	{ "ellisonleao/gruvbox.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "navarasu/onedark.nvim" },
	{ "gbprod/nord.nvim" },
	{ "Abstract-IDE/Abstract-cs" },
	{ "EdenEast/nightfox.nvim" },
	{
		"andrew-george/telescope-themes",
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
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	dependencies = {
	-- 		"echasnovski/mini.icons",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		local alpha = require("alpha")
	-- 		local theta = require("alpha.themes.theta")
	-- 		local dashboard = require("alpha.themes.dashboard")
	-- 		theta.buttons = {
	-- 			type = "group",
	-- 			val = {
	-- 				{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
	-- 				{ type = "padding", val = 1 },
	-- 				dashboard.button("e", "  New file", "<cmd>ene<CR>"),
	-- 				dashboard.button("SPC f f", "󰈞  Find da file"),
	-- 				dashboard.button("SPC f g", "󰊄  Live grep"),
	-- 				dashboard.button("c", "  Configuration", "<cmd>cd stdpath('config')<CR>"),
	-- 				dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
	-- 				dashboard.button("q", "󰅚  Quit", "<cmd>wqa<CR>"),
	-- 			},
	-- 			position = "center",
	-- 		}
	-- 		alpha.setup(theta.config)
	-- 	end,
	-- },
}
