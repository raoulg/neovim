return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		opts = {
			match_algoritm = "fzy",
		},
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope-fzy-native.nvim",
		},
	},
	{ "folke/which-key.nvim", lazy = true },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "tsakirist/telescope-lazy.nvim" },
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	{
		"desdic/agrolens.nvim",
		lazy = true,
		config = function()
			require("telescope").extensions = {
				agrolens = {
					debug = false,
					same_type = true,
					include_hidden_buffers = false,
					disable_indentation = false,
					aliases = {},
				},
			}
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
	},
	{
		"ahmedkhalf/project.nvim",
		lazy = false,
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				patterns = { ".git", ".venv", "src" },
			})
		end,
	},
	{
		"sidebar-nvim/sidebar.nvim",
		config = function()
			local width = vim.api.nvim_win_get_width(0)

			require("sidebar-nvim").setup({
				open = width > 250,
				-- open = true,
				side = "right",
				sections = { "datetime", "git", "diagnostics", "files", "todos" },
				todos = {
					icon = "",
					ignored_paths = { "~" }, -- ignore certain paths
					initially_closed = false, -- whether the groups should be initially closed on start.
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
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
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"stevearc/aerial.nvim",
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("aerial").setup({
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
			-- You probably also want to set a keymap to toggle aerial
			vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
		end,
	},
}
