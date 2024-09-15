-- require'telescope'.load_extension('project')

return {
	"folke/which-key.nvim",
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
		config = function()
			require("project_nvim").setup {
				detection_methods = { "pattern" },
				patterns = { ".git", ".venv", "src" },
			}
		end
	},
}
