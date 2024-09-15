local wk = require("which-key")

-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- quicklist
wk.add({
	{ "[q", "<cmd>cprev<CR>", desc = "Previous quicklist item" },
	{ "]q", "<cmd>cnext<CR>", desc = "Next quicklist item" },
})

-- toggles
wk.add({
	{ "<leader>t", group = "[T]oggle" },
	{
		"<leader>tb",
		"<cmd>let &background = ( &background == 'dark' ? 'light' : 'dark' )<CR>",
		desc = "toggle background",
	},
	{ "<leader>tn", "<cmd>setl nu!<CR>", desc = "line numbers" },
	{ "<leader>tr", "<cmd>setl rnu!<CR>", desc = "relative line numbers" },
	{ "<leader>y", group = "yank" },
	{ "<leader>yF", '<cmd>let @+ = expand("%")<CR>', desc = "yank current filename to system clipboard" },
	{ "<leader>yP", '<cmd>let @+ = expand("%:p")<CR>', desc = "yank full path to system clipboard" },
	{ "<leader>yf", '<cmd>let @" = expand("%")<CR>', desc = "yank current filename" },
	{ "<leader>yp", '<cmd>let @" = expand("%:p")<CR>', desc = "yank full path" },
})

vim.keymap.set({ "n", "v" }, "gx", ":execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>")

-- telescope
wk.add({
	{ "<leader>f", "Find everything" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Find recent files" },
	{ "<leader>fp", "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", desc = "List projects" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find recent buffers" },
	{ "<leader>fH", "<cmd>Telescope help_tags<CR>", desc = "Search help" },
	{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Search current word" },
	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
	{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Search diagnostics" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Search keymaps" },
	{ "<leader>fs", "<cmd>Telescope possession list<CR>", desc = "Search sessions" },
})

vim.keymap.set("n", "<leader>ft", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>f/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

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

-- Oil keymappings
wk.add({
	{ "<leader>o", "<cmd>Oil<CR>", desc = "Open oil" },
})

-- Windows naviation
wk.add({
	{ "<leader>w", group = "windows" },
	{ "<leader>ww", "<C-w>w", desc = "other window" },
	{ "<leader>wf", "<C-w>|", desc = "maximize window" },
	{ "<leader>wd", "<C-w>c", desc = "delete window" },
	{ "<leader>w-", "<C-w>s", desc = "split window below" },
	{ "<leader>w|", "<C-w>v", desc = "split window right" },
	{ "<leader>wh", "<C-w>h", desc = "window left" },
	{ "<leader>wH", "<C-w>10>", desc = "expand window right" },
	{ "<leader>wj", "<C-w>j", desc = "window below" },
	{ "<leader>wJ", "<cmd>resize +10<CR>", desc = "expand window down" },
	{ "<leader>wk", "<C-w>k", desc = "window up" },
	{ "<leader>wK", "<cmd>resize -10<CR>", desc = "expand window up" },
	{ "<leader>wl", "<C-w>l", desc = "window right" },
	{ "<leader>wL", "<C-w>10<", desc = "expand window left" },
	{ "<leader>w=", "<C-w>=", desc = "balance windows" },
})

-- LSP
wk.add({
	{ "<leader>l", group = "LSP" },
	{ "<leader>la", group = "LSP", desc = "LSP [A]ctions" },
	{ "<leader>lg", group = "LSP", desc = "LSP [G]oto" },
	{ "<leader>lw", group = "LSP", desc = "LSP [W]orkspaces" },
})

local nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

nmap("<leader>lar", vim.lsp.buf.rename, "[A]ction [R]ename")
nmap("<leader>laf", "<cmd>lua require('conform').format({ async = true })<CR>", "[A]ction [F]ormat")
nmap("<leader>lac", vim.lsp.buf.code_action, "[C]ode [A]ction")
nmap("<leader>lgd", vim.lsp.buf.definition, "[G]oto [D]efinition")
nmap("<leader>lgI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
nmap("<leader>lgD", vim.lsp.buf.type_definition, "Type [D]efinition")
nmap("<leader>lgr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
nmap("<leader>lgs", require("telescope.builtin").lsp_document_symbols, "[G]oto Document [s]ymbols")
nmap("<leader>lgS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[G]oto Workspace [S]ymbols")
nmap("<leader>lgD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

-- See `:help K` for why this keymap
nmap("K", vim.lsp.buf.hover, "Hover Documentation")
nmap("<leader>lK", vim.lsp.buf.hover, "Hover Documentation")
nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

-- Lesser used LSP functionality
nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
nmap("<leader>lwl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "[W]orkspace [L]ist Folders")

wk.add({
	{ "g", group = "LSP [G]oto" },
	{ "gd", vim.lsp.buf.definition, desc = "[G]oto [D]efinition" },
	{ "gI", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
	{ "gD", vim.lsp.buf.type_definition, desc = "Type [D]efinition" },
	{ "gr", "<cmd>lua require('telescope.builtin').lsp_references<CR>", desc = "[G]oto [R]eferences" },
	{ "gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols<CR>", desc = "[D]ocument [S]ymbols" },
	{ "gS", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols<CR>", desc = "[W]orkspace [S]ymbols" },
	{ "gD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
})

-- bufferline
local function open_split_buf(n, vert)
	return function()
		require("bufferline.commands").exec(n, function(buf, all_visible)
			local str = vert and "vert sbuffer " or "sbuffer "
			vim.cmd(str .. buf.id)
		end)
	end
end

local Bufferline = require("bufferline")
wk.add({
	{ ";", group = "manage buffers and tabs" },
	{
		";]",
		function()
			return Bufferline.cycle(1)
		end,
		desc = "cycle next",
	},
	{
		";[",
		function()
			return Bufferline.cycle(-1)
		end,
		desc = "cycle previous",
	},
	{
		";x",
		function()
			return vim.cmd("bd")
		end,
		desc = "close current buffer",
	},
	{
		";.",
		function()
			return Bufferline.close_in_direction("right")
		end,
		desc = "close all buffers to the right",
	},
	{
		";,",
		function()
			return Bufferline.close_in_direction("left")
		end,
		desc = "close all buffers to the left",
	},
	{
		";h",
		function()
			return vim.cmd("up | %bd | e#")
		end,
		desc = "delete hidden buffers",
	},
	{ ";s", group = "Open buffer in new split" },
	{ ";s1", open_split_buf(1, false), desc = "open buffer 1 in new split" },
	{ ";s2", open_split_buf(2, false), desc = "open buffer 2 in new split" },
	{ ";s3", open_split_buf(3, false), desc = "open buffer 3 in new split" },
	{ ";s4", open_split_buf(4, false), desc = "open buffer 4 in new split" },
	{ ";s5", open_split_buf(5, false), desc = "open buffer 5 in new split" },
	{ ";s6", open_split_buf(6, false), desc = "open buffer 6 in new split" },
	{ ";s7", open_split_buf(7, false), desc = "open buffer 7 in new split" },
	{ ";s8", open_split_buf(8, false), desc = "open buffer 8 in new split" },
	{ ";s9", open_split_buf(9, false), desc = "open buffer 9 in new split" },
	{ ";s0", open_split_buf(10, false), desc = "open buffer 10 in new split" },
	{ ";v", group = "Open buffer in new vertical split" },
	{ ";v1", open_split_buf(1, true), desc = "open buffer 1 in new vertical split" },
	{ ";v2", open_split_buf(2, true), desc = "open buffer 2 in new vertical split" },
	{ ";v3", open_split_buf(3, true), desc = "open buffer 3 in new vertical split" },
	{ ";v4", open_split_buf(4, true), desc = "open buffer 4 in new vertical split" },
	{ ";v5", open_split_buf(5, true), desc = "open buffer 5 in new vertical split" },
	{ ";v6", open_split_buf(6, true), desc = "open buffer 6 in new vertical split" },
	{ ";v7", open_split_buf(7, true), desc = "open buffer 7 in new vertical split" },
	{ ";v8", open_split_buf(8, true), desc = "open buffer 8 in new vertical split" },
	{ ";v9", open_split_buf(9, true), desc = "open buffer 9 in new vertical split" },
	{ ";v0", open_split_buf(10, true), desc = "open buffer 10 in new vertical split" },
})

-- Terminal
wk.add({
	{ "<leader>t", group = "[T]erminal" },
	{ "<leader>tt", "<cmd>ToggleTerm direction=vertical<CR>", desc = "vertical [t]erminal (can also do <C-\\>)" },
	{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Open [t]erminal horizontal" },
	{ "<leader>tz", "<cmd>vs term://zsh<cr>", desc = "open a [z]sh [t]erminal in a new vertical split" },
})

-- Possession session management
vim.keymap.set({ "n" }, "<leader>sl", ":PossessionLoad<CR>", { silent = false })
vim.keymap.set({ "n" }, "<leader>sd", ":PossessionDelete<CR>", { silent = false })
vim.keymap.set({ "n" }, "<leader>sf", ":Telescope possession list<CR>", { silent = false })

wk.add({
	{ "<leader>s", group = "[s]ession management" },
	{ "<leader>sS", ":PossesionSave ", desc = "name [S]ession" },
	{ "<leader>ss", ":PossesionSave<CR>", desc = "[S]ession [s]ave" },
})

-- sidebar.nvim
wk.add({
	{ "<leader>ts", ":SidebarNvimToggle<CR>", desc = "[t]oggle [s]idebar" },
})

-- git flog
-- fugitive
wk.add({
	{ "<leader>g", group = "[G]it" },
	{ "<leader>gg", '<cmd>TermExec cmd="gitui" direction=float<CR>', desc = "Open gitui in a floating terminal" },
	{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open diffview" },
	{ "<leader>gf", ":Flog<CR>", desc = "[G]it [F]log graph" },
	{ "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
	{ "<leader>ga", "<cmd>Git add %<CR>", desc = "Git add current file" },
	{ "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
	{ "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
	{ "<leader>gP", "<cmd>Git pull<CR>", desc = "Git pull" },
	{ "<leader>gl", "<cmd>Git log<CR>", desc = "Git log" },
	{ "<leader>gS", "<cmd>Git stash<CR>", desc = "Git stash" },
})

wk.add({
	{ "]c", "<cmd>Gitsigns next_hunk<CR>", desc = "next change" },
	{ "[c", "<cmd>Gitsigns prev_hunk<CR>", desc = "previous change" },
})
