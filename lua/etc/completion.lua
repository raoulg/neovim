Cmp = require("cmp")

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local function repltermcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- tab functionality for both Cmp and LuaSnip
local function tabfunc(fallback)
    if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(repltermcodes("<c-n>"), "n")
    elseif LuaSnip.expand_or_jumpable() then
        vim.fn.feedkeys(repltermcodes("<plug>luasnip-expand-or-jump"), "")
    elseif check_back_space() then
        vim.fn.feedkeys(repltermcodes("<tab>"), "n")
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
        ["<tab>"] = tabfunc,
        ["<s-tab>"] = Cmp.mapping.select_prev_item(),
        ["<cr>"] = Cmp.mapping.confirm({
            behavior = Cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<c-e>"] = Cmp.mapping.close(),
    },
})
