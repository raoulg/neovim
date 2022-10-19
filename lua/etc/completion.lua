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
    if Cmp.visible() then
        Cmp.select_next_item()
    elseif has_words_before() then
        Cmp.complete()
    else
        fallback()
    end
end

local function quickconfirm(select)
    return function(fallback)
        if Cmp.visible() then
            Cmp.confirm({behavior=Cmp.ConfirmBehavior.Insert, select=select})
            Cmp.close()
        end
        fallback()
    end
end


local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}


Cmp.setup({
    sources = {
        {name = "nvim_lua"},
        {name = "latex_symbols"},
        {name = "path"},
        {name = "luasnip"},
        {name = "buffer"},
    },
    window = {
        documentation = {border="rounded"},
    },
    formatting = {
        format = function(entry, item)
            item.kind = string.format("%s", kind_icons[item.kind])
            item.menu = ({
                nvim_lua = "",
                buffer = "",
                latex_symbols = "ﭨ",
                path = "",
                luasnip = "✂",
            })[entry.source.name]
            return item
        end,
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
            --this is important, it prevents <cr> from completing if nothing selected;
            --otherwise it gest really aggravating at the end of a line
            select = false,
        }),
        ["<Space>"] = quickconfirm(false),
        ["<Right>"] = quickconfirm(true),
        ["<C-e>"] = Cmp.mapping.close(),
    },
})
