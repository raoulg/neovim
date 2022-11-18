
NvimTree = require("nvim-tree")

NvimTree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,

    view = {
        width = 40,
        side = "left",
    },
})

WhichKey.register({
    name = "nvim tree",
    [","] = {":NvimTreeToggle<CR>", "toggle NvimTree", noremap=true},
    ["/"] = {":NvimTreeFindFile<CR>", "find file with NvimTree", noremap=true},
    r = {":NvimTreeRefresh<CR>", "refresh NvimTree", noremap=true},
    f = {":NvimTreeFocus<CR>", "focus nvimtree", noremap=true},
}, {prefix=","})

vim.api.nvim_set_hl(0, "NvimTreeWindowPicker", {fg=colors.bgdark, bg=colors.cyan})
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", {fg=colors.purple})
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", {fg=colors.pink})
vim.api.nvim_set_hl(0, "NvimTreeExecFile", {fg=colors.green})
vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", {fg=colors.orange})
