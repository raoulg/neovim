return {
	{
		"jedrzejboczar/possession.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("possession").setup({
				autosave = {
					current = true, -- or fun(name): boolean
					cwd = true, -- or fun(): boolean
					tmp = false, -- or fun(): boolean
					tmp_name = "tmp", -- or fun(): string
					on_load = true,
					on_quit = true,
				},
				autoload = true, -- or 'last' or 'auto_cwd' or 'last_cwd' or fun(): string
				commands = {
					save = "PossessionSave",
					load = "PossessionLoad",
					save_cwd = "PossessionSaveCwd",
					load_cwd = "PossessionLoadCwd",
					rename = "PossessionRename",
					close = "PossessionClose",
					delete = "PossessionDelete",
					show = "PossessionShow",
					list = "PossessionList",
					list_cwd = "PossessionListCwd",
					migrate = "PossessionMigrate",
				},
				-- autoload = "auto_cwd", -- or 'last' or 'auto_cwd' or 'last_cwd' or fun(): string
			})
			require("telescope").load_extension("possession")
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			-- { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup()
		end,
		keys = {
			{ "<leader>v", "<cmd>VenvSelect<cr>" },
		},
	},
	{
		"Chaitanyabsprip/fastaction.nvim",
		---@type FastActionConfig
		opts = {},
	},
	{
		"danymat/neogen",
		-- config = true,
		config = function()
			require("neogen").setup({
				languages = {
					python = {
						template = {
							annotation_convention = "numpydoc",
						},
					},
				},
			})
		end,
	},
	{ "LudoPinelli/comment-box.nvim" },
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},
	{
		"ziontee113/color-picker.nvim",
		config = function()
			require("color-picker")
		end,
	},
	{ "nvchad/minty", lazy = true, dependencies = { "nvchad/volt" } },
	{
		"neph-iap/easycolor.nvim",
		dependencies = { "stevearc/dressing.nvim" }, -- Optional, but provides better UI for editing the formatting template
		opts = {},
		keys = { { "<leader>B", "<cmd>EasyColor<cr>", desc = "Color Picker" } },
		config = function()
			require("easycolor").setup({
				color_format = "hex",
				ui = {
					mappings = {
						q = "close_window", -- The action when q is pressed, close window by default.
						j = "move_cursor_down", -- The action when j is pressed, move cursor down by default.
						k = "move_cursor_up", -- The action when k is pressed, move cursor up by default.
						h = "move_cursor_left", -- The action when h is pressed, move cursor left by default.
						l = "move_cursor_right", -- The action when l is pressed, move cursor right by default.
						["J"] = "hue_down", -- The action when <Down> is pressed, hue down by default.
						["K"] = "hue_up", -- The action when <Up> is pressed, hue up by default.
						["<Enter>"] = "insert_color", -- The action when <Enter> is pressed, insert color by default.
						t = "edit_formatting_template", -- The action when t is pressed, edit formatting template by default.
					},
				},
			})
		end,
	},
	{
		"NyxVim/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = {
					"css",
					"scss",
					"javascript",
					html = { mode = "foreground" },
				},
			})
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
			require("cmp").config.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
		end,
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		ft = { "org" },
		config = function()
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/code/org/**/*",
				org_default_notes_file = "~/code/org/refile.org",
				mappings = {
					global = {
						org_agenda = { "gA", "<Leader>Oa" },
						org_capture = { "gC", "<Leader>Oc" },
					},
				},
			})

			-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
			-- add ~org~ to ignore_install
			-- require('nvim-treesitter.configs').setup({
			--   ensure_installed = 'all',
			--   ignore_install = { 'org' },
			-- })
		end,
	},
	{
		"alexpasmantier/pymple.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- optional (nicer ui)
			"stevearc/dressing.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		build = ":PympleBuild",
		config = function()
			require("pymple").setup({
				keymaps = {
					-- Resolves import for symbol under cursor.
					-- This will automatically find and add the corresponding import to
					-- the top of the file (below any existing doctsring)
					resolve_import_under_cursor = {
						desc = "Resolve import under cursor",
						keys = ",i", -- feel free to change this to whatever you like
					},
				},
				-- automatically register the following keymaps on plugin setup
			})
		end,
	},

	{ "wakatime/vim-wakatime", lazy = false },
	{
		"ActivityWatch/aw-watcher-vim",
	},
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
		config = function()
			require("quicker").setup({
				keys = {
					{
						">",
						function()
							require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
						end,
						desc = "Expand quickfix context",
					},
					{
						"<",
						function()
							require("quicker").collapse()
						end,
						desc = "Collapse quickfix context",
					},
				},
			})
		end,
	},
	{
		"quentingruber/timespent.nvim",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{ "<leader>tT", "<cmd>:ShowTimeSpent<cr>", mode = { "n" }, desc = "Show time spent" },
		},
	},
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true },
				panel = { enabled = true },
				filetypes = { markdown = true },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		lazy = false,
		opts = {},
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
			{
				"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
				opts = {},
			},
			"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "ollama",
					},
					inline = {
						adapter = "ollama",
					},
					agent = {
						adapter = "ollama",
					},
				},
				adapters = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							schema = {
								model = {
									default = "eramax/nxcode-cq-7b-orpo:q6",
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = true,
		lazy = false,
		event = "VeryLazy",
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			-- vim.g.vimtex_view_method = "zathura"
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		event = "VeryLazy",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "[L]azy[G]it" },
		},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
