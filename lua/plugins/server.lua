return {
	{
		"ActivityWatch/aw-watcher-vim",
	},
	{
		"zbirenbaum/copilot.lua",
		lazy = false,
		cmd = "Copilot",
		-- event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true },
				panel = { enabled = true },
				-- filetypes = { markdown = true },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		lazy = false,
		-- event = "InsertEnter",
		opts = {},
	},
	{
		"olimorris/codecompanion.nvim",
		lazy = true,
		event = "InsertEnter",
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
		keys = {
			{ "<leader>ca", "<cmd>CodeCompanionActions<CR>", desc = "Show [c]ode LLM [a]ctions", mode = "n" },
			{ "<leader>ca", "<cmd>CodeCompanionActions<CR>", desc = "Show [c]ode LLM [a]ctions", mode = "v" },
			{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", desc = "[c]ode LLM [t]oggle", mode = { "n", "v" } },
			{ "<leader>cd", "<cmd>CodeCompanion Add<CR>", desc = "[c]ode LLM a[d]d" },
			{ "<leader>ci", "<cmd>CodeCompanion<CR>", desc = "[c]ode LLM [i]nline chat" },
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
	-- Autocompletion
	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>e",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				-- NOTE: this requires a version of yazi that includes
				-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "g?",
			},
		},
	},
	-- Formatter
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = "BufReadPre",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "ruff_format", "ruff_fix" },
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"iguanacucumber/magazine.nvim", -- maintained fork from hrsh7th
		name = "nvim-cmp", -- Otherwise highlighting gets messed up
		event = "VeryLazy",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"kdheepak/cmp-latex-symbols",
			"micangl/cmp-vimtex",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"zbirenbaum/copilot.lua",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "vimtext" },
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "orgmode" },
					{ name = "emoji" },
					{
						name = "latex_symbols",
						option = {
							strategy = 0,
						},
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<tab>"] = cmp.mapping.confirm({
						select = true,
					}),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end,
	},
}
