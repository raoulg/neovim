local Wilder = require('wilder')
Wilder.setup({modes = {':', '/', '?'}})
-- Disable Python remote plugin
Wilder.set_option("use_python_remote_plugin", 0)

Wilder.set_option("pipeline", {
  Wilder.branch(
    Wilder.cmdline_pipeline({
      fuzzy = 1,
      fuzzy_filter = Wilder.lua_fzy_filter(),
    }),
    Wilder.vim_search_pipeline()
  )
})

local function makehl()
    hl1 = Wilder.make_hl("WilderAccent", "Pmenu", {{a=1}, {a=1}, {foreground=colors.purple}})
    hlb = Wilder.make_hl("WilderBorder", "Pmenu", {{a=1}, {a=1}, {foreground=colors.comment}})
    return {accent = hl1, border = hlb}
end

local function make_cmd_renderer()
    local args = {
        highlighter = Wilder.lua_fzy_highlighter(),
        highlights = makehl(),
        left = {
            ' ',
            Wilder.popupmenu_devicons()
        },
        right = {
            ' ',
            Wilder.popupmenu_scrollbar()
        },
        border = "rounded",
    }
    return Wilder.popupmenu_renderer(Wilder.popupmenu_border_theme(args))
end

local function make_search_renderer()
    local args = {
        highlighter = Wilder.lua_fzy_highlighter(),
        highlights = makehl(),
        border = "single",
    }
    return Wilder.popupmenu_renderer(Wilder.popupmenu_border_theme(args))
end

Wilder.set_option("renderer", Wilder.renderer_mux {
    [":"] = make_cmd_renderer(),
    ["/"] = make_search_renderer(),
    ["?"] = make_search_renderer(),
})

