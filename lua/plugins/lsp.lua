return {
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
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "copilot" },
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({
						-- documentation says this is important.
						-- I don't know why.
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
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
				ensure_installed = {},
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

	-- LSP
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- 	config = function()
	-- 		require("mason-lspconfig").setup({
	-- 			ensure_installed = { "pyright", "ruff", "lua_ls" },
	-- 			handlers = {
	-- 				-- this first function is the "default handler"
	-- 				-- it applies to every language server without a "custom handler"
	-- 				function(server_name)
	-- 					require("lspconfig")[server_name].setup({})
	-- 				end,
	-- 			},
	-- 		})
	-- 		local lspconfig = require("lspconfig")
	--
	-- 		-- find venv
	-- 		lspconfig.pyright.setup({
	-- 			on_init = function(client)
	-- 				client.config.settings.python.venvPath = vim.fn.getcwd()
	-- 				client.config.settings.python.pythonPath = vim.fn.getcwd() .. "/.venv/bin/python"
	-- 			end,
	-- 		})
	--
	-- 		lspconfig.ruff.setup({})
	--
	-- 		lspconfig.lua_ls.setup({
	-- 			settings = {
	-- 				Lua = {
	-- 					runtime = {
	-- 						-- Tell the language server which version of Lua you're using
	-- 						-- (most likely LuaJIT in the case of Neovim)
	-- 						version = "LuaJIT",
	-- 					},
	-- 					diagnostics = {
	-- 						-- Get the language server to recognize the `vim` global
	-- 						globals = {
	-- 							"vim",
	-- 							"require",
	-- 						},
	-- 					},
	-- 					workspace = {
	-- 						-- Make the server aware of Neovim runtime files
	-- 						library = vim.api.nvim_get_runtime_file("", true),
	-- 					},
	-- 					-- Do not send telemetry data containing a randomized but unique identifier
	-- 					telemetry = {
	-- 						enable = false,
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "python", "markdown" },

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
		lazy = false,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "ruff_format", "ruff_fix" },
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
