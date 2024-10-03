return {
	{
		"jedrzejboczar/possession.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("possession").setup({
				autosave = {
					current = false, -- or fun(name): boolean
					cwd = false, -- or fun(): boolean
					tmp = false, -- or fun(): boolean
					tmp_name = "tmp", -- or fun(): string
					on_load = true,
					on_quit = true,
				},
				commands = {
					save = "PossessionSave",
					load = "PossessionLoad",
					save_cwd = "PossessionSaveCwd",
					load_cwd = "PossessionLoadCwd",
					rename = "PossessionRename",
					close = "PossessionClose",
					delete = "PossessionDelete",
					show = "PossessionShow",
					list = "PossessionList",
					list_cwd = "PossessionListCwd",
					migrate = "PossessionMigrate",
				},
				-- autoload = "auto_cwd", -- or 'last' or 'auto_cwd' or 'last_cwd' or fun(): string
			})
			require("telescope").load_extension("possession")
		end,
	},
}
