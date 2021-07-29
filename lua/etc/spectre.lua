local Spectre = require("spectre")

WhichKey.register({
    S = {Spectre.open, "open spectre search and replace"},
    a = {Spectre.open_file_search, "open search and replace in current file only"},
}, {prefix="\\"})

WhichKey.register({
    f = {
        s = {Spectre.open_visual, "open spectre search and replace in visual mode"},
        w = {function() Spectre.open_visual({selected_word=true}) end, "search and replace on selected word"}
    },
}, {mode="v", prefix="\\"})

Spectre.setup({
    color_devicons = true,
})
