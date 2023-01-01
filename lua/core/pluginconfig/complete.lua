Cmp = require("cmp")


local function quickconfirm(select, feedspace)
    return function(fallback)
        if Cmp.visible() then
            Cmp.confirm({ behavior = Cmp.ConfirmBehavior.Insert, select = select })
            Cmp.close()
            -- this is *supposed* to be fallback() but annoyingly that will eat inputs
            -- so this is a rather scary and hackish substitute
            if feedspace then vim.api.nvim_feedkeys(" ", "i", true) end
        else
            fallback()
        end
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
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "path" },
        { name = "buffer" },
    },
    -- sources = {
    --     {name = "nvim_lua"},
    --     {name = "latex_symbols"},
    --     {name = "path"},
    --     {name = "luasnip"},
    --     {name = "buffer"},
    -- },
    window = {
        documentation = { border = "rounded" },
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
        ["<Tab>"] = Cmp.mapping.select_next_item({ behavior = Cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = Cmp.mapping.select_prev_item({ behavior = Cmp.SelectBehavior.Insert }),
        ["<CR>"] = Cmp.mapping.confirm({
            --this is important, it prevents <cr> from completing if nothing selected;
            --otherwise it gest really aggravating at the end of a line
            select = false,
        }),
        ["<Space>"] = quickconfirm(false, true),
        ["<Right>"] = quickconfirm(true, true),
        ["<C-e>"] = Cmp.mapping.close(),
    },
})


--
-- -- nvim-cmp setup
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
--
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--   },
-- }
