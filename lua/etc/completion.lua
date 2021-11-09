Cmp = require("cmp")

local function has_words_before()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local l, c = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, l-1, l, true)[1]:sub(c,c):match("%s") == nil
end

local function repltermcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function feedkey(k, mode)
    vim.api.nvim_feedkeys(repltermcodes(k), mode, true)
end

-- this is unnecesary for this config, but useful as reference
local function tabfunc(fallback)
    if vim.fn.pumvisible() == 1 then
        feedkey("<c-n>", "n")
    elseif has_words_before() then
        Cmp.complete()
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
        ["<Tab>"] = Cmp.mapping.select_next_item({behavior=Cmp.SelectBehavior.Insert}),
        ["<S-Tab>"] = Cmp.mapping.select_prev_item({behavior=Cmp.SelectBehavior.Insert}),
        ["<CR>"] = Cmp.mapping.confirm({
            behavior = Cmp.ConfirmBehavior.Insert,
            --this is important, it prevents <cr> from completing if nothing selected;
            --otherwise it gest really aggravating at the end of a line
            select = false,
        }),
        ["<C-e>"] = Cmp.mapping.close(),
    },
})
