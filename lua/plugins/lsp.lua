-- LSP Configuration
return {
	-- LSP UI Enhancements
	{
		"nvimdev/lspsaga.nvim",
		lazy = true,
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>cs", "<cmd>Lspsaga finder<CR>", desc = "Lspsaga finder" },
			{ "<leader>cp", "<cmd>Lspsaga peek_definition<CR>", desc = "Lspsaga peek definition" },
		},
	},

	-- LSP Core Components
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		dependencies = {
			-- LSP Management
			{
				"williamboman/mason.nvim",
				config = true,
			},
			{
				"williamboman/mason-lspconfig.nvim",
			},
			-- CMP Integration
			{
				"hrsh7th/cmp-nvim-lsp",
			},
		},
		config = function()
			-- Diagnostics configuration
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					format = function(diagnostic)
						return string.format("%s [%s]", diagnostic.message, diagnostic.code or "")
					end,
				},
			})

			-- LSP keybindings - applied on LSP server attach
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

			-- Default capabilities - enhanced with nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configure language servers
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Add your preferred language servers here
					-- "pyright",
					-- "lua_ls",
				},
				handlers = {
					-- Default handler for all LSP servers
					function(server_name)
						require("lspconfig")[server_name].setup({
							on_attach = lsp_attach,
							capabilities = capabilities,
						})
					end,

					-- Custom server configurations
					pyright = function()
						require("lspconfig").pyright.setup({
							on_attach = lsp_attach,
							capabilities = capabilities,
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
							on_attach = lsp_attach,
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									diagnostics = {
										globals = {
											"vim",
											"require",
										},
									},
									workspace = {
										library = vim.api.nvim_get_runtime_file("", true),
									},
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

	-- Snippets
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

	-- Treesitter for better syntax highlighting
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
}
