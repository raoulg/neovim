local wk = require("which-key")

-- set keymap for :w to save current buffer
vim.keymap.set("n", ",,", "<cmd>w<CR>", { noremap = true, silent = true, desc = "Save current buffer" })

wk.add({
	{ "<leader>U", "<cmd>Lazy<CR>", desc = "[U]pdate via Lazy" },
})

-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- quicklist
wk.add({
	{ "[q", "<cmd>cprev<CR>", desc = "Previous quicklist item" },
	{ "]q", "<cmd>cnext<CR>", desc = "Next quicklist item" },
	{ "[Q", "<cmd>cfirst<CR>", desc = "First quicklist item" },
	{ "]Q", "<cmd>clast<CR>", desc = "Last quicklist item" },
	{ "]C", "<cmd>cclose<CR>", desc = "Close quicklist" },
	{ "]C", "<cmd>cclose<CR>", desc = "Close quicklist" },
})
vim.keymap.set("n", "<leader>q", function()
	require("quicker").toggle()
end, {
	desc = "Toggle quickfix",
})
vim.keymap.set("n", "<leader>L", function()
	require("quicker").toggle({ loclist = true })
end, {
	desc = "Toggle loclist",
})

-- toggles
wk.add({
	{ "<leader>T", group = "toggle" },
	{
		"<leader>Tb",
		"<cmd>let &background = ( &background == 'dark' ? 'light' : 'dark' )<CR>",
		desc = "toggle background",
	},
	{ "<leader>Tn", "<cmd>setl nu!<CR>", desc = "line numbers" },
	{ "<leader>Tm", "<cmd>lua require('render-markdown').toggle()<CR>", desc = "Toggle Markdown" },
	{ "<leader>Tr", "<cmd>setl rnu!<CR>", desc = "relative line numbers" },
	{ "<leader>y", group = "yank" },
	{ "<leader>yf", '<cmd>let @+ = expand("%")<CR>', desc = "[y]ank current [f]ilename to system clipboard" },
	{ "<leader>yP", '<cmd>let @+ = expand("%:p")<CR>', desc = "[y]ank full [p]ath to system clipboard" },
	{ "<leader>yp", '<cmd>let @" = expand("%:p")<CR>', desc = "[y]ank full [p]ath" },
	{ "<leader>yf", '<cmd>let @" = expand("%")<CR>', desc = "[y]ank current [F]ilename" },
	{ "<leader>y", '"+y', desc = "[y]ank to system clipboard", mode = "v" },
})

vim.keymap.set({ "n", "v" }, "gx", ":execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>")

-- telescope
wk.add({
	{ "<leader>f", "Find everything" },
	{ "<leader>fC", "<cmd>TodoTelescope<CR>", desc = "[f]ind all project todo [C]omments" },
	{ "<leader>fF", "<cmd>Telescope find_files<CR>", desc = "Find files" },
	{ "<leader>ff", "<cmd>Telescope smart_open<CR>", desc = "[F]ind [F]requency based items" },
	{
		"<leader>fP",
		"<cmd>lua require('telescope').extensions.smart_open.smart_open {cwd_only = true}<CR>",
		desc = "Find files in [P]resent working dir",
	},
	{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Find recent files" },
	{ "<leader>fp", "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", desc = "List projects" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find recent buffers" },
	{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Find marks" },
	{ "<leader>fH", "<cmd>Telescope help_tags<CR>", desc = "Search help" },
	{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Search diagnostics" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Search keymaps" },
	{ "<leader>fs", "<cmd>Telescope possession list<CR>", desc = "Search sessions" },
	{ "<leader>fj", "<cmd>lua require('telescope.builtin').jumplist{}<CR>", desc = "[f]ind [j]umplist" },
	{ "<leader>fL", "<cmd>Telescope lazy<CR>", desc = "Telescope Lazy plugins" }, -- <C-o> open in brower
})

wk.add({
	{ "<leader>ft", group = "[F]ind [T]reesitter objects" },
	{
		"<leader>fto",
		"<cmd>lua require('telescope.builtin').treesitter{}<CR>",
		desc = "[f]ind default [t]reesitter [o]bjects",
	},
	{ "<leader>ftf", "<cmd>Telescope agrolens query=functions<CR>", desc = "[T]reesitter [f]unctions" },
	{
		"<leader>ftF",
		"<cmd>Telescope agrolens query=functions buffers=all<CR>",
		desc = "[T]reesitter [F]unctions in all buffers",
	},
})

vim.keymap.set("n", "<leader>fT", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

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

-- LSP legacy keymaps
-- wk.add({
-- 	{ "<leader>l", group = "LSP" },
-- 	{ "<leader>la", group = "LSP", desc = "LSP [A]ctions" },
-- 	{ "<leader>lg", group = "LSP", desc = "LSP [G]oto" },
-- 	{ "<leader>lw", group = "LSP", desc = "LSP [W]orkspaces" },
-- })
-- nmap("<leader>lar", vim.lsp.buf.rename, "[A]ction [R]ename")
-- nmap("<leader>laf", "<cmd>lua require('conform').format({ async = true })<CR>", "[A]ction [F]ormat")
-- nmap("<leader>lac", vim.lsp.buf.code_action, "[C]ode [A]ction")
-- nmap("<leader>lgd", vim.lsp.buf.definition, "[G]oto [D]efinition")
-- nmap("<leader>lgI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
-- nmap("<leader>lgD", vim.lsp.buf.type_definition, "Type [D]efinition")
-- nmap("<leader>lgr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
-- nmap("<leader>lgs", require("telescope.builtin").lsp_document_symbols, "[G]oto Document [s]ymbols")
-- nmap("<leader>lgS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[G]oto Workspace [S]ymbols")
-- nmap("<leader>lgD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
--
-- -- See `:help K` for why this keymap
-- nmap("K", vim.lsp.buf.hover, "Hover Documentation")
-- nmap("<leader>lK", vim.lsp.buf.hover, "Hover Documentation")
-- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
--
-- -- Lesser used LSP functionality
-- nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
-- nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
-- nmap("<leader>lwl", function()
-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, "[W]orkspace [L]ist Folders")

-- LSP Telescope keymaps
wk.add({
	{ "<leader>fl", group = "[f]ind [l]sp" },
	{ "<leader>fls", require("telescope.builtin").lsp_document_symbols, desc = "[L]SP document [s]ymbols" },
	{ "<leader>flS", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "[L]SP workspace [S]ymbols" },
	{ "<leader>flr", require("telescope.builtin").lsp_references, desc = "[L]SP [r]eferences" },
	{ "<leader>fli", require("telescope.builtin").lsp_implementations, desc = "[L]SP [i]mplementations" },
	{ "<leader>fld", require("telescope.builtin").lsp_definitions, desc = "[L]SP [d]efinitions" },
	{ "<leader>flt", require("telescope.builtin").lsp_type_definitions, desc = "[L]SP type [d]efinitions" },
	{ "<leader>flI", require("telescope.builtin").lsp_incoming_calls, desc = "[L]SP incoming [c]alls" },
	{ "<leader>flo", require("telescope.builtin").lsp_outgoing_calls, desc = "[L]SP outgoing [c]alls" },
	{ "<leader>flds", require("telescope.builtin").diagnostics, desc = "[L]SP [d]iagnostics" },
})

-- dashboard
wk.add({
	{ "gh", ":Dashboard<CR>", desc = "[G]oto [h]ome Dashboard" },
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
	{ ";p", ":BufferLinePick<CR>", desc = "pick buffer to goto" },
	{ ";c", ":BufferLinePickClose<CR>", desc = "pick and close buffer" },
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
	{ "<leader>ss", "<Plug>(REPLStart)", desc = "[S]tart REPL" },
	{ "<leader>st", "<Plug>(REPLHideOrFocus)", desc = "REPL [t]oggle" },
	{ "<leader>sf", "<Plug>(REPLFocus)", desc = "REPL [F]ocus" },
	{ "<leader>sh", "<Plug>(REPLHide)", desc = "REPL [H]ide" },
	{ "<leader>sc", "<Plug>(REPLClose)", desc = "REPL [C]lose" },
	{ "<leader>sl", "<Plug>(REPLSendVisual)", desc = "REPL Send Visual [l]ines", mode = "v" },
	{ "<leader>sl", "<Plug>(REPLSendLine)", desc = "REPL Send [l]ine", mode = "n" },
	{ "<leader>sb", "<cmd>REPLAttachBufferToREPL<CR>", desc = "Attach current [b]uffer" },
	{ "<leader>sB", "<cmd>REPLDetachBufferToREPL<CR>", desc = "Detach current [B]uffer" },
})

-- Possession session management
vim.keymap.set({ "n" }, "<leader>Sl", ":PossessionLoad<CR>", { silent = false })
vim.keymap.set({ "n" }, "<leader>Sd", ":PossessionDelete<CR>", { silent = false })
vim.keymap.set({ "n" }, "<leader>Sf", ":Telescope possession list<CR>", { silent = false })

wk.add({
	{ "<leader>S", group = "[s]ession management" },
	{ "<leader>SS", ":PossessionSave ", desc = "name [S]ession" },
	{ "<leader>Ss", ":PossessionSave<CR>", desc = "[S]ession [s]ave" },
})

-- sidebar.nvim
wk.add({
	{ "<leader>Ts", ":SidebarNvimToggle<CR>", desc = "[t]oggle [s]idebar" },
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
	{ "<leader>gc", "<cmd>Git commit<CR>", desc = "Git [c]ommit" },
	{ "<leader>gp", "<cmd>Git push<CR>", desc = "Git [p]ush" },
	{ "<leader>gP", "<cmd>Git pull<CR>", desc = "Git [P]ull" },
	{ "<leader>gL", "<cmd>Git log<CR>", desc = "Git [L]og" },
	{ "<leader>gS", "<cmd>Git stash<CR>", desc = "Git [S]ash" },
})

wk.add({
	{ "]c", "<cmd>Gitsigns next_hunk<CR>", desc = "next change" },
	{ "[c", "<cmd>Gitsigns prev_hunk<CR>", desc = "previous change" },
})

-- todo-comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- code companion
wk.add({
	{ "<leader>c", group = "[c]ode companion LLM" },
	{ "<leader>ca", "<cmd>CodeCompanionActions<CR>", desc = "Show [c]ode LLM [a]ctions", mode = "n" },
	{ "<leader>ca", "<cmd>CodeCompanionActions<CR>", desc = "Show [c]ode LLM [a]ctions", mode = "v" },
	{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", desc = "[c]ode LLM [t]oggle", mode = "n" },
	{ "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>", desc = "[c]ode LLM [t]oggle", mode = "v" },
	{ "<leader>cd", "<cmd>CodeCompanion Add<CR>", desc = "[c]ode LLM a[d]d" },
	{ "<leader>ci", "<cmd>CodeCompanion<CR>", desc = "[c]ode LLM [i]nline chat" },
})

-- latex
wk.add({
	{ "<leader>l", group = "LaTeX commands" },
	{ "<leader>li", "<cmd>VimtexInfo<CR>", desc = "show latex info", noremap = true },
	{ "<leader>lI", "<cmd>VimtexInfoFull<CR>", desc = "show full latex info", noremap = true },
	{ "<leader>lt", "<cmd>VimtexTocOpen<CR>", desc = "open latex table of contents", noremap = true },
	{ "<leader>lT", "<cmd>VimtexTocToggle<CR>", desc = "toggle latex table of contents", noremap = true },
	{ "<leader>lq", "<cmd>VimtexLog<CR>", desc = "show latex compiler log", noremap = true },
	{ "<leader>lv", "<cmd>VimtexView<CR>", desc = "view latex output", noremap = true },
	{ "<leader>ll", "<cmd>VimtexCompile<CR>", desc = "start latex compilation", noremap = true },
	{ "<leader>lL", "<cmd>VimtexCompileSelected<CR>", desc = "start latex compilation for selection", noremap = true },
	{ "<leader>lk", "<cmd>VimtexStop<CR>", desc = "stop latex compilation", noremap = true },
	{ "<leader>lK", "<cmd>VimtexStopAll<CR>", desc = "stop all latex compilation", noremap = true },
	{ "<leader>le", "<cmd>VimtexErrors<CR>", desc = "show latex compilation errors", noremap = true },
	{ "<leader>lo", "<cmd>VimtexCompileOutput<CR>", desc = "open file where compiler is redirected", noremap = true },
	{ "<leader>lg", "<cmd>VimtexStatus<CR>", desc = "show latex compiler status", noremap = true },
	{ "<leader>lG", "<cmd>VimtexStatusAll<CR>", desc = "show latex compiler status for all", noremap = true },
	{ "<leader>lc", "<cmd>VimtexClean<CR>", desc = "clean latex output", noremap = true },
	{ "<leader>lC", "<cmd>VimtexCleanAll<CR>", desc = "clean all latex output", noremap = true },
	{ "<leader>lx", "<cmd>VimtexReload<CR>", desc = "reload vimtex", noremap = true },
	{ "<leader>la", "<cmd>VimtexContextMenu<CR>", desc = "open latex context menu", noremap = true },
	{ "<leader>lu", ":call LaTeXtoUnicode#Toggle()<CR>", desc = "toggle latex-to-unicode", noremap = true },
})

wk.add({
	{ "<leader>x", group = "Trouble" },
	{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Zenmode" },
})

wk.add({
	{ "<leader>b", group = "Colorpicker" },
	{ "<leader>bh", "<cmd>lua require('minty.huefy').open()<CR>", desc = "Minty huefy" },
	{ "<leader>bs", "<cmd>lua require('minty.shades').open()<CR>", desc = "Minty shades" },
})

-- smart split resize
vim.keymap.set("n", "<C-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").resize_right)

-- Docstrings
wk.add({
	{ "<leader>D", group = "[D]ocstrings" },
	{ "<leader>DD", "<cmd>lua require('neogen').generate()<CR>", desc = "Generate [D]ocstring" },
	{
		"<leader>Dc",
		"<cmd>lua require('neogen').generate({type = 'class'})<CR>",
		desc = "Generate [D]ocstring [c]lass",
	},
	{ "<leader>Db", "<cmd>CBclbox<CR>", desc = "Generate [b]ox", mode = { "n", "v" } },
	{ "<leader>Dt", "<Cmd>CBllline<CR>", desc = "[b]ox [t]itled Line", mode = { "n", "v" } },
})

-- debug
wk.add({
	{ "<leader>d", group = "Debug" },
	{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "breakpoint" },
	{ "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "continue" },
	{ "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", desc = "step over" },
	{ "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "step into" },
	{ "<leader>dt", "<cmd>lua require'dapui'.toggle()<CR>", desc = "toggle ui" },
	{ "<leader>dr", "<cmd>lua require'dapui'.open({ reset = true })<CR>", desc = "reset ui" },
})
