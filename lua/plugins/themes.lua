local header = {
	[[            ___             ]],
	[[          /\   \            ]],
	[[         /  \___\           ]],
	[[        _\  / __/_          ]],
	[[       /\ \/_/\   \         ]],
	[[      /  \__/  \___\        ]],
	[[     _\  /  \  / __/_       ]],
	[[    /\ \/___/\/_/\   \      ]],
	[[   /  \___\    /  \___\     ]],
	[[  _\  /   /_  _\__/ __/_    ]],
	[[ /\ \/___/  \/\   \/\   \   ]],
	[[/  \___\ \___\ \___\ \___\  ]],
	[[\  /   / /   / /   / /   /  ]],
	[[ \/___/\/___/\/___/\/___/   ]],
}
return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			exclude_ft = { "REPL" },
			icons = {
				-- Configure the base icons on the bufferline.
				-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
				buffer_index = false,
				buffer_number = false,
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
			},
		},

		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	-- {
	-- 	"tomiis4/BufferTabs.nvim",
	-- 	enabled = false,
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons", -- optional
	-- 	},
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("buffertabs").setup({
	-- 			show_single_buffer = false,
	-- 			horizontal = "right",
	-- 			-- config
	-- 		})
	-- 	end,
	-- },
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{ "LudoPinelli/comment-box.nvim", opts = {} },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			notify = {
				enabled = false,
				view = "notify",
			},
			-- lsp = {
			-- 	-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			-- 	override = {
			-- 		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 		["vim.lsp.util.stylize_markdown"] = true,
			-- 		["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			-- 	},
			-- },
			-- -- you can enable a preset for easier configuration
			-- presets = {
			-- 	bottom_search = true, -- use a classic bottom cmdline for search
			-- 	command_palette = true, -- position the cmdline and popupmenu together
			-- 	long_message_to_split = true, -- long messages will be sent to a split
			-- 	inc_rename = false, -- enables an input dialog for inc-rename.nvim
			-- 	lsp_doc_border = false, -- add a border to hover docs and signature help
			-- },
			-- messages = {
			-- 	-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- 	-- This is a current Neovim limitation.
			-- 	enabled = true, -- enables the Noice messages UI
			-- 	view = "mini", -- default view for messages
			-- 	view_error = "split", -- view for errors
			-- 	view_warn = "split", -- view for warnings
			-- 	view_history = "messages", -- view for :messages
			-- 	view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			-- },
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
		enabled = true,
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					shortcut = {
						{ desc = "Raoul Grouls", group = "DashboardShortCut" },
					},
					header = header,
					week_header = {
						enable = false,
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
					lualine_a = {
						{
							"mode",
						},
					},
					lualine_c = {
						{
							"filename",
							file_status = true, -- Displays file status (readonly status, modified status)
							newfile_status = false, -- Display new file status (new file means no write after created)
							path = 3,
						},
					},
					lualine_y = { "aerial" },
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
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
