return {
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		config = function()
			local function termsize(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				end
			end

			require("toggleterm").setup({
				size = termsize,
				open_mapping = "<C-\\>",
				hide_numbers = false,
				shade_terminals = true,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = "zsh", -- set the default shell
				float_opts = {
					border = "curved", -- can be "double", "shadow", "curved" or "single"
					--width = 80,
					--height = 60,
					winblend = 3,
					-- highlights = {
					--     border = "ToggleTermBorder",
					--     background = "ToggleTermBackground",
					-- }
				},
			})
		end,
	},
}
