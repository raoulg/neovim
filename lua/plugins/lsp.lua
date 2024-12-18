return {
	{
		"nvimdev/lspsaga.nvim",
		lazy = true,
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		keys = {
			{ "<leader>ft", "<cmd>Lspsaga finder<CR>", desc = "Lspsaga finder" },
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		lazy = true,
		config = false,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	-- Autocompletion
	{
		-- "hrsh7th/nvim-cmp",
		"iguanacucumber/magazine.nvim", -- maintained fork from hrsh7th
		name = "nvim-cmp", -- Otherwise highlighting gets messed up
		event = "VeryLazy",
		dependencies = {
			{
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
					{ name = "luasnip" },
					{
						name = "latex_symbols",
						option = {
							strategy = 0,
						},
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<tab>"] = cmp.mapping.confirm({
						-- documentation says this is important.
						-- I don't know why.
						-- behavior = cmp.ConfirmBehavior.Replace,
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
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		lazy = true,
		event = "InsertEnter",
		config = function()
			local luasnip = require("luasnip")
			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					format = function(diagnostic)
						return string.format("%s [%s]", diagnostic.message, diagnostic.code or "")
					end,
				},
			})
			local lsp_zero = require("lsp-zero")

			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					-- "pyright",
					-- "lua_ls",
				},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					pyright = function()
						require("lspconfig").pyright.setup({
							on_init = function(client)
								local venvPath = vim.fn.getcwd()
								local pythonPath = venvPath .. "/.venv/bin/python"

								client.config.settings.python.venvPath = venvPath
								client.config.settings.python.pythonPath = pythonPath

								vim.notify("Python path: " .. pythonPath)
							end,
						})
					end,
					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									runtime = {
										-- Tell the language server which version of Lua you're using
										-- (most likely LuaJIT in the case of Neovim)
										version = "LuaJIT",
									},
									diagnostics = {
										-- Get the language server to recognize the `vim` global
										globals = {
											"vim",
											"require",
										},
									},
									workspace = {
										-- Make the server aware of Neovim runtime files
										library = vim.api.nvim_get_runtime_file("", true),
									},
									-- Do not send telemetry data containing a randomized but unique identifier
									telemetry = {
										enable = false,
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = "BufReadPre",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"gitignore",
					"html",
					"http",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"regex",
					"typescript",
					"vim",
				},
				ignore_install = {},
				modules = {},

				sync_install = false,
				auto_install = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = "BufReadPre",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "ruff_format", "ruff_fix" },
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
