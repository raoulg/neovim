return {
	{
		"renerocksai/telekasten.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"toppair/peek.nvim",
			"nvim-telekasten/calendar-vim",
		},
		config = function()
			require("telekasten").setup({
				home = "/Users/rgrouls/code/pttrn/notes",
				daily_notes = {
					date_format = "%Y-%m-%d",
				},
			})
		end,
	},
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin wil only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true, -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			-- you'll need at least one of these
			{ "nvim-telescope/telescope.nvim" },
			-- {'ibhagwan/fzf-lua'},
		},
		keys = {
			{ "<leader>yh", "<cmd>Telescope neoclip<CR>", desc = "[y]ank history (<c-p> to paste)" },
			{ "<leader>ym", "<cmd>Telescope macroscope<CR>", desc = "macros history (<c-p> to paste)" },
		},
		lazy = true,
		event = "BufReadPre",
		opts = {},
	},
	-- Lua
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
		keys = {
			{
				"<leader>SS",
				function()
					require("persistence").load()
				end,
				desc = "load session",
			},
			{
				"<leader>Ss",
				function()
					require("persistence").select()
				end,
				desc = "select session",
			},
		},
	},
	{
		"echasnovski/mini.sessions",
		version = false,
		opts = {},
	},
	-- Lua
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			-- { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = true,
		event = "BufEnter *.py",
		branch = "regexp", -- This is the regexp branch, use this for the new version
		opts = {},
		keys = {
			{ "<leader>v", "<cmd>VenvSelect<cr>", desc = "venv selector" },
		},
	},
	{
		"Chaitanyabsprip/fastaction.nvim",
		---@type FastActionConfig
		opts = {},
		keys = {
			{ "<leader>fa", '<cmd>lua require("fastaction").code_action()<CR>', desc = "code actions" },
		},
	},
	{
		"danymat/neogen",
		keys = {
			{ "<leader>cD", "<cmd>lua require('neogen').generate()<CR>", desc = "Generate [D]ocstring" },
			{
				"<leader>cC",
				"<cmd>lua require('neogen').generate({type = 'class'})<CR>",
				desc = "Generate [D]ocstring [c]lass",
			},
		},
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
	{
		"LudoPinelli/comment-box.nvim",
		lazy = true,
		event = "InsertEnter",
		keys = {
			{ "<leader>cb", "<cmd>CBclbox<CR>", desc = "Generate docstring [b]ox", mode = { "n", "v" } },
			{ "<leader>cl", "<Cmd>CBllline<CR>", desc = "box titled [l]ine", mode = { "n", "v" } },
		},
	},
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
		lazy = true,
		event = "InsertEnter",
		opts = {},
	},
	{
		"nvchad/minty",
		lazy = true,
		dependencies = { "nvchad/volt" },
		keys = {
			{ "<leader>bh", "<cmd>lua require('minty.huefy').open()<CR>", desc = "Minty huefy" },
			{ "<leader>bs", "<cmd>lua require('minty.shades').open()<CR>", desc = "Minty shades" },
		},
	},
	{
		"neph-iap/easycolor.nvim",
		dependencies = { "stevearc/dressing.nvim" }, -- Optional, but provides better UI for editing the formatting template
		opts = {},
		keys = { { "<leader>bb", "<cmd>EasyColor<cr>", desc = "Easycolor" } },
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
		lazy = true,
		ft = { "css", "scss", "javascript", "html" },
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
		lazy = true,
		event = { "BufEnter *.css", "BufEnter *.html", "BufEnter *.scss" },
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
	-- { "wakatime/vim-wakatime" },
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
		config = function()
			require("which-key").add({
				{ "<leader>Tq", "<cmd>lua require('quicker').toggle()<CR>", desc = "Toggle quickfix" },
				{ ",t", "<cmd>lua require('quicker').toggle()<CR>", desc = "Toggle quickfix" },
			})
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
	-- {
	-- 	"quentingruber/timespent.nvim",
	-- 	lazy = true,
	-- 	cmd = "ShowTimeSpent",
	-- 	-- event = "VeryLazy",
	-- 	keys = {
	-- 		{ "<leader>tT", "<cmd>:ShowTimeSpent<cr>", mode = { "n" }, desc = "Show time spent" },
	-- 	},
	-- },
	{
		"GCBallesteros/jupytext.nvim",
		config = true,
		lazy = true,
		event = "BufReadPre *.ipynb",
	},
	{
		"lervag/vimtex",
		lazy = false,
		-- event = "InsertEnter",
		-- tag = "v2.15", -- uncomment to pin to a specific release
		keys = {
			{ "<leader>li", "<cmd>VimtexInfo<CR>", desc = "show latex info", noremap = true },
			{ "<leader>lI", "<cmd>VimtexInfoFull<CR>", desc = "show full latex info", noremap = true },
			{ "<leader>lt", "<cmd>VimtexTocOpen<CR>", desc = "open latex table of contents", noremap = true },
			{ "<leader>lT", "<cmd>VimtexTocToggle<CR>", desc = "toggle latex table of contents", noremap = true },
			{ "<leader>lq", "<cmd>VimtexLog<CR>", desc = "show latex compiler log", noremap = true },
			{ "<leader>lv", "<cmd>VimtexView<CR>", desc = "view latex output", noremap = true },
			{ "<leader>ll", "<cmd>VimtexCompile<CR>", desc = "start latex compilation", noremap = true },
			{
				"<leader>lL",
				"<cmd>VimtexCompileSelected<CR>",
				desc = "start latex compilation for selection",
				noremap = true,
			},
			{ "<leader>lk", "<cmd>VimtexStop<CR>", desc = "stop latex compilation", noremap = true },
			{ "<leader>lK", "<cmd>VimtexStopAll<CR>", desc = "stop all latex compilation", noremap = true },
			{ "<leader>le", "<cmd>VimtexErrors<CR>", desc = "show latex compilation errors", noremap = true },
			{
				"<leader>lo",
				"<cmd>VimtexCompileOutput<CR>",
				desc = "open file where compiler is redirected",
				noremap = true,
			},
			{ "<leader>lg", "<cmd>VimtexStatus<CR>", desc = "show latex compiler status", noremap = true },
			{ "<leader>lG", "<cmd>VimtexStatusAll<CR>", desc = "show latex compiler status for all", noremap = true },
			{ "<leader>lc", "<cmd>VimtexClean<CR>", desc = "clean latex output", noremap = true },
			{ "<leader>lC", "<cmd>VimtexCleanAll<CR>", desc = "clean all latex output", noremap = true },
			{ "<leader>lx", "<cmd>VimtexReload<CR>", desc = "reload vimtex", noremap = true },
			{ "<leader>la", "<cmd>VimtexContextMenu<CR>", desc = "open latex context menu", noremap = true },
		},
		init = function()
			-- VimTeX configuration goes here, e.g.
			-- vim.g.vimtex_view_method = "zathura"
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		event = "InsertEnter",
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
		keys = {
			{ "<leader>GG", "<cmd>LazyGit<cr>", desc = "Lazy[G]it" },
			{ "<leader>Gc", "<cmd>LazyGitCurrentFile<cr>", desc = "Lazy[G]it current file" },
		},
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		event = "InsertEnter",
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
