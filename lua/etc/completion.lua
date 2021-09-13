Cmp = require("cmp")

local function repltermcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- tab functionality for both Cmp and LuaSnip
local function tabfunc(fallback)
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(repltermcodes("<c-n>"), "n")
    elseif LuaSnip.expand_or_jumpable() then
        vim.fn.feedkeys(repltermcodes("<plug>luasnip-expand-or-jump"), "")
    else
        fallback()
    end
end

Cmp.setup({
    sources = {
        {name = "nvim_lua"},
        {name = "latex_symbols"},
        {name = "path"},
        {name = "luasnip"},
        {name = "buffer"},
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<tab>"] = Cmp.mapping.select_next_item(),
        ["<s-tab>"] = Cmp.mapping.select_prev_item(),
        ["<c-i>"] = Cmp.mapping.confirm({
            --NOTE: it's hard to decide which is appropriate for most situations
            --behavior = Cmp.ConfirmBehavior.Replace,
            behavior = Cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ["<c-e>"] = Cmp.mapping.close(),
    },
})
