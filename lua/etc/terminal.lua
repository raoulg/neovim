local ToggleTerm = require("toggleterm")
local Terminal = require("toggleterm/terminal").Terminal

local function termsize(term)
    if term.direction == "horizontal" then
        return 20
    elseif term.direction == "vertical" then
        return vim.o.columns * 0.3
    end
end

sethighlight("ToggleTermBorder", {fg=colors.pink, bg=colorsbgdarker})
sethighlight("ToggleTermBackground", {fg=colors.bgdark, bg=colors.bgdark})

ToggleTerm.setup({
    size = termsize,
    open_mapping = "<C-\\>",
    hide_numbers = false,
    shade_terminals = true,
    shading_factor = "<number>",  -- the degree by which to darken to terminal color
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,  -- set the default shell
    float_opts = {
        border = "curved",  -- can be "double", "shadow", "curved" or "single"
        --width = 80,
        --height = 60,
        winblend = 3,
        highlights = {
            border = "ToggleTermBorder",
            background = "ToggleTermBackground",
        }
    },
})

WhichKey.register({
    r = {
        name = "REPL and terminal interaction",
        l = {":Luapad<CR>", "open a luapad", noremap=true},
        t = {":ToggleTerm<CR>", "toggle terminal (can also do <C-\\>)", noremap=true},
        h = {":lua _htop_term_toggle()<CR>", "show htop in a floating terminal", noremap=true},
        j = {":lua _julia_term_toggle()<CR>", "toggle a Julia terminal", noremap=true},
        z = {"<cmd>vs term://zsh<CR>", "open a zsh terminal in a new vertical split", noremap=true},
        x = {"<cmd>vs term://julia<CR>", "open a Julia REPL in a new vertical split", noremap=true},
    },
}, {prefix="<leader>"})

-- terminal mode bindings
-- NOTE: it *is* possible to create macros that go directly into the terminal!!
-- TODO add lots of cool functionality here.
WhichKey.register({
    ["<C-n>"] = {"<cmd>stopinsert!<CR>", "get out of insert mode", noremap=true},
}, {mode="t"})

local htopterm = Terminal:new({
    cmd = "htop",
    direction = "float",
})
function _htop_term_toggle() return htopterm:toggle() end

-- TODO julia terminal with automatic include
-- TODO use TermExec to send useful stuff

local juliaterm = Terminal:new({
    cmd = "julia",
    direction = "horizontal",
})
function _julia_term_toggle() return juliaterm:toggle() end
