-- require'telescope'.load_extension('project')

return {
	{ "folke/which-key.nvim", lazy = true },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local function print_numbers(opts)
				return string.format("%s", opts.raise(opts.ordinal), opts.raise(opts.id))
			end
			require("bufferline").setup({
				options = {
					numbers = print_numbers,
				},
			})
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		lazy = true,
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
				open = width > 150,
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
}
