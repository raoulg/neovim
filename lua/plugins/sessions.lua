return {
	{
		"jedrzejboczar/possession.nvim",
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
				autoload = last, -- or 'last' or 'auto_cwd' or 'last_cwd' or fun(): string
			})
			require("telescope").load_extension("possession")
		end,
	},
}
