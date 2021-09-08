LuaSnip = require("luasnip")

local Events = require("luasnip.util.events")
local Loader = require("luasnip.loaders.from_vscode")

local parser = LuaSnip.parser

local s = LuaSnip.snippet
local sn = LuaSnip.snippet_node
local isn = LuaSnip.indent_snippet_node
local t = LuaSnip.text_node
local i = LuaSnip.insert_node
local f = LuaSnip.function_node
local c = LuaSnip.choice_node
local d = LuaSnip.dynamic_node

LuaSnip.config.set_config({
    history = true,
    enable_autosnippets = false,
})

-- see help LuaSnip
-- and example here: https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua

LuaSnip.snippets = {
    all = {
    },
}

Loader.lazy_load({
    paths = {"~/.config/nvim/snippets"}
})

WhichKey.register({
    ["<c-s>"] = {function() return LuaSnip.expand_or_jump() end, "expand snippet; or jump to next snippet position"},
    ["<c-w>"] = {function() return LuaSnip.jump(-1) end, "jump to previous snippet position"},
}, {mode="i"})
