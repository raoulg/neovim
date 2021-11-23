
--WARN: this is not nearly done!

vim.g.aerial = {
    backends = {"treesitter", "markdown"},
    close_behavior = "auto",
    default_bindings = true,
    default_direction = "prefer_right",
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
}

WhichKey.register({
    a = {
        name = "aerial code navigation",
        a = {"<cmd>AerialToggle<cr>", "toggle aerial code navigation buffer"},
        n = {"<cmd>AerialNext<cr>", "jump forward one symbol"},
        p = {"<cmd>AerialPrev<cr>", "jump backward one symbol"},
    }
}, {prefix="<leader>"})
