return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = true,
		event = "InsertEnter",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>n", "<cmd>Neotree<CR>", desc = "Neotree <C-n>" },
			{ "<C-n>", "<cmd>Neotree<CR>", desc = "Neotree" },
		},
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
					},
				},
			})
		end,
	},
	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>-",
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
				show_help = "<f1>",
			},
		},
	},
	{
		"simonmclean/triptych.nvim",
		lazy = true,
		cmd = "Triptych",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-tree/nvim-web-devicons", -- optional
		},
		keys = {
			{ "<leader>e", "<cmd>Triptych<CR>", desc = "File explorer" },
			{ "<C-e>", "<cmd>Triptych<CR>", desc = "File explorer <C-e>" },
		},
		config = function()
			require("triptych").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			-- see keymaps for telescope config
			{
				"<leader>ma",
				function()
					require("harpoon"):list():add()
				end,
				desc = "add to list",
			},
			{
				"<leader>mt",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
				desc = "toggle quick menu",
			},
			{
				"<leader>ms",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "goto 1",
			},
			{
				"<leader>md",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "goto 2",
			},
			{
				"<leader>mj",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "goto 3",
			},
			{
				"<leader>mk",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "goto 4",
			},
			{
				"<leader>mp",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "previous buffer",
			},
			{
				"<leader>mn",
				function()
					require("harpoon"):list():next()
				end,
				desc = "next buffer",
			},
		},
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"danielfalk/smart-open.nvim",
		-- lazy = true,
		-- cmd = "Telescope",
		keys = {
			{ "<leader>fF", "<cmd>Telescope smart_open<CR>", desc = "[F]ind [F]requency based items" },
			{
				"<leader>fP",
				"<cmd>lua require('telescope').extensions.smart_open.smart_open {cwd_only = true}<CR>",
				desc = "Find files in [P]resent working dir",
			},
		},
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
	{
		"folke/which-key.nvim",
		lazy = true,
		opts = {
			---@type false | "classic" | "modern" | "helix"
			preset = "modern",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
			require("telescope").load_extension("fzy_native")
		end,
		keys = {
			{
				"<leader>fls",
				require("telescope.builtin").lsp_document_symbols,
				desc = "[L]SP document [s]ymbols",
			},
			{
				"<leader>flS",
				require("telescope.builtin").lsp_dynamic_workspace_symbols,
				desc = "[L]SP workspace [S]ymbols",
			},
			{ "<leader>flr", require("telescope.builtin").lsp_references, desc = "[L]SP [r]eferences" },
			{
				"<leader>fli",
				require("telescope.builtin").lsp_implementations,
				desc = "[L]SP [i]mplementations",
			},
			{ "<leader>fld", require("telescope.builtin").lsp_definitions, desc = "[L]SP [d]efinitions" },
			{ "<leader>flD", require("telescope.builtin").diagnostics, desc = "[L]SP [d]iagnostics" },
			{
				"<leader>flt",
				require("telescope.builtin").lsp_type_definitions,
				desc = "[L]SP type [d]efinitions",
			},
			{
				"<leader>flI",
				require("telescope.builtin").lsp_incoming_calls,
				desc = "[L]SP incoming [c]alls",
			},
			{
				"<leader>flo",
				require("telescope.builtin").lsp_outgoing_calls,
				desc = "[L]SP outgoing [c]alls",
			},
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep pwd" },
			{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files{}<CR>", desc = "find files pwd" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find recent buffers" },
			{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Find marks" },
			{ "<leader>fH", "<cmd>Telescope help_tags<CR>", desc = "Search help" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Search diagnostics" },
			{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Search keymaps" },
			{ "<leader>fj", "<cmd>lua require('telescope.builtin').jumplist{}<CR>", desc = "[f]ind [j]umplist" },
			{
				"<leader>fxo",
				"<cmd>lua require('telescope.builtin').treesitter{}<CR>",
				desc = "[f]ind default [t]reesitter [o]bjects",
			},
			{
				"<leader>f/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(
						-- get_dropdown, get_ivy
						require("telescope.themes").get_ivy({ winblend = 10, previewer = true })
					)
				end,
				desc = "Fuzzily search in buffer]",
			},
		},
	},
	{
		"tsakirist/telescope-lazy.nvim",
		keys = {
			{ "<leader>fL", "<cmd>Telescope lazy<CR>", desc = "Telescope Lazy plugins" }, -- <C-o> open in brower
		},
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		keys = {
			{ "<leader>o", "<cmd>Oil<CR>", desc = "Open oil" },
		},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
	{
		"desdic/agrolens.nvim",
		lazy = true,
		keys = {
			{ "<leader>fxf", "<cmd>Telescope agrolens query=functions<CR>", desc = "[T]reesitter [f]unctions" },
			{
				"<leader>fxF",
				"<cmd>Telescope agrolens query=functions buffers=all<CR>",
				desc = "[T]reesitter [F]unctions in all buffers",
			},
		},
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
		keys = {},
	},
	{
		"ahmedkhalf/project.nvim",
		lazy = false,
		keys = {
			{ "<leader>fp", "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", desc = "List projects" },
		},
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				patterns = { ".git", ".venv", "src" },
			})
		end,
	},
	{
		"sidebar-nvim/sidebar.nvim",
		keys = {
			{ "<leader>Ts", "<cmd>SidebarNvimToggle<CR>", desc = "Toggle sidebar" },
		},
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
		lazy = true,
		event = "InsertEnter",
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
		lazy = true,
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>fc", "<cmd>TodoTelescope<CR>", desc = "[f]ind all project todo [c]omments" },
			-- { "]t", require("todo-comments").jump_next(), desc = "Next todo comment" },
			-- { "[t", require("todo-comments").jump_prev(), desc = "Previous todo comment" },
		},
		opts = {},
	},
	{
		"stevearc/aerial.nvim",
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		event = "InsertEnter",
		keys = {
			{ "<leader>ct", "<cmd>AerialToggle!<CR>", desc = "Aerial code tree" },
		},
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
		end,
	},
}
