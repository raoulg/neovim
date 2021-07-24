
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = {".git", ".cache"}
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_highlight_opened_files = 1

WhichKey.register({
    t = {
        name = "nvim tree",
        t = {":NvimTreeToggle<CR>", "toggle", noremap=true},
        r = {":NvimTreeRefresh<CR>", "refresh", noremap=true},
        ["/"] = {":NvimTreeFindFile<CR>", "find file", noremap=true},
    }
}, {prefix="<leader>"})
