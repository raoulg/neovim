
NvimTree = require("nvim-tree")

NvimTree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    auto_close = false,

    view = {
        width = 40,
        side = "left",
        auto_resize = true,
    },
})

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
