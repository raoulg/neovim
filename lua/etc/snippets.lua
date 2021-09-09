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

local _modes = {"i", "s", "n"}
for m = 1, #_modes do
    WhichKey.register({
        ["<c-s>"] = {
            name = "snippet control",
            j = {function() return LuaSnip.expand_or_jump() end, "expand snippet; or jump to next snippet position"},
            k = {function() return LuaSnip.jump(-1) end, "jump to previous snippet position"},
            l = {function() return LuaSnip.change_choice(1) end, "next snippet node choice"},
            h = {function() return LuaSnip.change_choice(-1) end, "previous snippet node choice"},
            u = {function() return LuaSnip.unlink_current() end, "unlink current snippet"},
            U = {function() return LuaSnip.unlink_current_if_deleted() end, "unlink current if deleted"},
        }
    }, {mode=_modes[m]})
end

