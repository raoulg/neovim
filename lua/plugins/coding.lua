return {
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"ActivityWatch/aw-watcher-vim",
	},
	-- {
	-- 	"lincore81/eigenzeit.nvim",
	-- 	config = function()
	-- 		require("eigenzeit").setup({})
	-- 	end,
	-- },
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
				suggestion = { enabled = false },
				panel = { enabled = true },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		lazy = true,
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
					anthropic = function()
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
	-- nvim v0.8.0
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
}
