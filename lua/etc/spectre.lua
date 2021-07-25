local Spectre = require("spectre")

WhichKey.register({
    f = {
        S = {Spectre.open, "open spectre search and replace", noremap=true},
        ["1"] = {function() Spectre.open_visual({select_word=true}) end,
                 "open visual search and replace with selected word"},
        v = {Spectre.open_visual, "open search and replace visual", noremap=true},
        a = {Spectre.open_file_search, "open search and replace in current file only", noremap=true}
    },
}, {prefix="<leader>"})

Spectre.setup({
    color_devicons = true,
})
