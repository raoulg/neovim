local Aerial = require("aerial")

Aerial.setup({
    backends = {"treesitter", "markdown"},
    default_bindings = true,
    filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Struct",
    },
    highlight_mode = "split_width",
    highlight_on_jump = 300,  -- time in ms to highlight after jumping
    layout = {
        min_width = 16,
        default_direction = "prefer_right",
    },
})

WhichKey.register({
    a = {
        name = "aerial code navigation",
        a = {"<cmd>AerialToggle!<cr>", "toggle aerial code navigation buffer"},
        n = {"<cmd>AerialNext<cr>", "jump forward one symbol"},
        p = {"<cmd>AerialPrev<cr>", "jump backward one symbol"},
    }
}, {prefix="<leader>"})
