
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = {".git", ".cache"}
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_highlight_opened_files = 1

WhichKey.register({
    name = "nvim tree",
    [","] = {":NvimTreeToggle<CR>", "toggle NvimTree", noremap=true},
    ["/"] = {":NvimTreeFindFile<CR>", "find file with NvimTree", noremap=true},
    r = {":NvimTreeRefresh<CR>", "refresh NvimTree", noremap=true},
}, {prefix=","})

sethighlight("NvimTreeWindowPicker", {fg=colors.bgdark, bg=colors.cyan})
sethighlight("NvimTreeFolderIcon", {fg=colors.purple})
sethighlight("NvimTreeIndentMarker", {fg=colors.pink})
sethighlight("NvimTreeExecFile", {fg=colors.green})
sethighlight("NvimTreeOpenedFile", {fg=colors.orange})
