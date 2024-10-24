return {
	{
		"milanglacier/yarepl.nvim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("telescope").load_extension("REPLShow")
			local yarepl = require("yarepl")
			yarepl.setup({
				-- see `:h buflisted`, whether the REPL buffer should be buflisted.
				buflisted = false,
				ft = "REPL",
				-- wincmd = "belowright 15 split",
				wincmd = "vertical 50 split",
				-- The available REPL palattes that `yarepl` can create REPL based on
				metas = {
					python = { cmd = "python", formatter = yarepl.formatter.trim_empty_lines },
					aichat = { cmd = "aichat", formatter = yarepl.formatter.bracketed_pasting },
					radian = { cmd = "radian", formatter = yarepl.formatter.bracketed_pasting },
					ipython = { cmd = "ipython", formatter = yarepl.formatter.bracketed_pasting },
					bpython = { cmd = "bpython", formatter = yarepl.formatter.trim_empty_lines },
					R = { cmd = "R", formatter = yarepl.formatter.trim_empty_lines },
					bash = { cmd = "bash", formatter = yarepl.formatter.trim_empty_lines },
					zsh = { cmd = "zsh", formatter = yarepl.formatter.bracketed_pasting },
				},
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		event = "InsertEnter",
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
