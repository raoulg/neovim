local Cmp = require("cmp")

Cmp.setup({
    sources = {
        {name = "nvim_lua"},
        {name = "latex_symbols"},
        {name = "path"},
        {name = "buffer"},
    },
    mapping = {
        -- these are remapped to tab in general.lua; recommend keeping both
        ["<c-n>"] = Cmp.mapping.select_next_item(),
        ["<c-p>"] = Cmp.mapping.select_prev_item(),
        ["<cr>"] = Cmp.mapping.confirm({
            behavior = Cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<c-e>"] = Cmp.mapping.close(),
    },
})
