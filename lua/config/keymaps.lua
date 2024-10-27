local wk = require("which-key")
-- groups
wk.add({
	{ ";", group = "manage buffers and tabs" },
	{ ";o", group = "Order buffers" },
	{ "<leader>b", group = "Colorpicker" },
	{ "<leader>c", group = "[c]ode" },
	{ "<leader>d", group = "Debug" },
	{ "<leader>f", group = "Find everything" },
	{ "<leader>fx", group = "[F]ind [T]reesitter objects" },
	{ "<leader>fl", group = "[f]ind [l]sp" },
	{ "<leader>G", group = "Git" },
	{ "<leader>l", group = "LaTeX commands" },
	{ "<leader>S", group = "Sessions" },
	{ "<leader>T", group = "toggle" },
	{ "<leader>x", group = "Trouble" },
	{ "<leader>y", group = "yank" },
	{ "<leader>O", group = "org" },
	{ "<leader>L", group = "Lazy" },
})

-- set keymap for :w to save current buffer
vim.keymap.set("n", ",,", "<cmd>w<CR>", { noremap = true, silent = true, desc = "Save current buffer" })
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- open files with gx
vim.keymap.set({ "n", "v" }, "gx", ":execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>", { desc = "open stuff" })

-- quicklist
wk.add({
	{ "[q", "<cmd>cprev<CR>", desc = "Previous quicklist item" },
	{ "]q", "<cmd>cnext<CR>", desc = "Next quicklist item" },
	{ "[Q", "<cmd>cfirst<CR>", desc = "First quicklist item" },
	{ "]Q", "<cmd>clast<CR>", desc = "Last quicklist item" },
	{ "]C", "<cmd>cclose<CR>", desc = "Close quicklist" },
	{ "]C", "<cmd>cclose<CR>", desc = "Close quicklist" },
})

-- toggles
wk.add({
	{
		"<leader>Tb",
		"<cmd>let &background = ( &background == 'dark' ? 'light' : 'dark' )<CR>",
		desc = "toggle background",
	},
	{ "<leader>Tn", "<cmd>setl nu!<CR>", desc = "line numbers" },
	{ "<leader>Tr", "<cmd>setl rnu!<CR>", desc = "relative line numbers" },
	-- yanks
	{ "<leader>yf", '<cmd>let @+ = expand("%")<CR>', desc = "[y]ank current [f]ilename to system clipboard" },
	{ "<leader>yP", '<cmd>let @+ = expand("%:p")<CR>', desc = "[y]ank full [p]ath to system clipboard" },
	{ "<leader>yp", '<cmd>let @" = expand("%:p")<CR>', desc = "[y]ank full [p]ath" },
	{ "<leader>yF", '<cmd>let @" = expand("%")<CR>', desc = "[y]ank current [F]ilename" },
	{ "<leader>yy", '"+y', desc = "[y]ank to system clipboard", mode = "v" },
})

-- directory stuff
wk.add({
	{ ",", group = "Filesystem and directory functions" },
	{ ",a", "<cmd>:set autochdir!<CR>", desc = "toggle auto directory switching" },
	{ ",p", "<cmd>:pwd<CR>", desc = "show current working directory" },
	{ ",d", "<cmd>:cd %:p:h<CR>:pwd<CR>", desc = "change to directory of current file" },
	{ ",e", "<cmd>:cd %:p:h/..<CR>:pwd<CR>", desc = "change to parent directory of current file" },
	{ ",h", "<cmd>:cd<CR>:pwd<CR>", desc = "change to home directory" },
	{ ",J", "<cmd>:cd -<CR>:pwd<CR>", desc = "change to previous directory" },
})

-- Windows naviation
wk.add({
	{ "<leader>w", group = "windows" },
	{ "<leader>ww", "<C-w>w", desc = "other window" },
	{ "<leader>wf", "<C-w>|", desc = "maximize window" },
	{ "<leader>wd", "<C-w>c", desc = "delete window" },
	{ "<leader>wD", "<C-w>o", desc = "delete all other windows" },
	{ "<leader>w-", "<C-w>s", desc = "split window below" },
	{ "<leader>w|", "<C-w>v", desc = "split window right" },
	{ "<leader>wh", "<C-w>h", desc = "window left" },
	{ "<leader>wL", "<C-w>10>", desc = "expand window right" },
	{ "<leader>wH", "<C-w>10<", desc = "expand window left" },
	{ "<leader>wj", "<C-w>j", desc = "window below" },
	{ "<leader>wk", "<C-w>k", desc = "window up" },
	{ "<leader>wl", "<C-w>l", desc = "window right" },
	{ "<leader>w=", "<C-w>=", desc = "balance windows" },
	{ "<leader>ws", "<C-w>x", desc = "swap windows" },
})

-- harpoon , marks
local harpoon = require("harpoon")
harpoon:setup()
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end
	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end
wk.add({
	{ "<leader>m", group = "Harpoon marks" },
	{
		"<leader>fh",
		function()
			toggle_telescope(harpoon:list())
		end,
		desc = "find harpoon",
	},
})

vim.keymap.set("n", "<leader>Tq", function()
	require("quicker").toggle()
end, {
	desc = "Toggle quickfix",
})
-- Terminal
wk.add({
	{ "<leader>t", group = "Terminal" },
	{ "<leader>tt", "<cmd>ToggleTerm direction=vertical<CR>", desc = "vertical [t]erminal (can also do <C-\\>)" },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "vertical [t]erminal (can also do <C-\\>)" },
	{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Open [t]erminal horizontal" },
	{ "<leader>tz", "<cmd>vs term://zsh<cr>", desc = "open a [z]sh [t]erminal in a new vertical split" },
	{ "<C-n>", "<cmd>stopinsert!<CR>", desc = "get out insert mode", noremap = true, mode = "t" },
	{ "jj", "<cmd>stopinsert!<CR>", desc = "get out insert mode", noremap = true, mode = "t" },
})

-- yarepl
wk.add({
	{ "<leader>s", group = "send to repl" },
	{ "<leader>sf", "<cmd>Telescope REPLShow<CR>", desc = "Find all REPLs" },
	{ "<leader>ss", "<Plug>(REPLStart)", desc = "[S]tart REPL" },
	{ "<leader>st", "<Plug>(REPLHideOrFocus)", desc = "REPL [t]oggle" },
	{ "<leader>sF", "<Plug>(REPLFocus)", desc = "REPL [F]ocus" },
	{ "<leader>sh", "<Plug>(REPLHide)", desc = "REPL [H]ide" },
	{ "<leader>sc", "<Plug>(REPLClose)", desc = "REPL [C]lose" },
	{ "<leader>sl", "<Plug>(REPLSendVisual)", desc = "REPL Send Visual [l]ines", mode = "v" },
	{ "<leader>sl", "<Plug>(REPLSendLine)", desc = "REPL Send [l]ine", mode = "n" },
	{ "<leader>sb", "<cmd>REPLAttachBufferToREPL<CR>", desc = "Attach current [b]uffer" },
	{ "<leader>sB", "<cmd>REPLDetachBufferToREPL<CR>", desc = "Detach current [B]uffer" },
})

