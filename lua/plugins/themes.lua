return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			--   `nvim-notify` is only needed, if you want to use the notification view.
			"rcarriga/nvim-notify",
		},
	},
	{ "rebelot/kanagawa.nvim" },
	{ "folke/zen-mode.nvim", dependencies = { "folke/twilight.nvim", opts = { context = 10 } } },
	{ "mrjones2014/smart-splits.nvim" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
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
					project = {
						enable = true,
						limit = 10,
						action = "Telescope find_files cwd=",
					},
					mru = { limit = 10, cwd_only = false },
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
