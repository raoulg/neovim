
local function termsize(term)
    if term.direction == "horizontal" then
        return 20
    elseif term.direction == "vertical" then
        return vim.o.columns * 0.3
    end
end

-- vim.api.nvim_set_hl(0, "ToggleTermBorder", {fg=COLORS.pink, bg=colorsbgdarker})
-- vim.api.nvim_set_hl(0, "ToggleTermBackground", {fg=COLORS.bgdark, bg=COLORS.bgdark})

require("toggleterm").setup({
    size = termsize,
    open_mapping = "<C-\\>",
    hide_numbers = false,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = "zsh",  -- set the default shell
    float_opts = {
        border = "curved",  -- can be "double", "shadow", "curved" or "single"
        --width = 80,
        --height = 60,
        winblend = 3,
        -- highlights = {
        --     border = "ToggleTermBorder",
        --     background = "ToggleTermBackground",
        -- }
    },
})

local Terminal = require("toggleterm/terminal").Terminal
local Iron = require("iron.core")

Iron.setup({
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        command = {"zsh"}
      },
      python = {
        command = {"poetry", "run", "ptpython"}

      },
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').split.vertical("50%")
  },
  -- If the highlight is on, you can change how it looks
  -- this is highlight for last sent block
  highlight = {
    italic = true
  }
})

WhichKey = require("which-key")

WhichKey.register({
    r = {
        name = "REPL and terminal interaction",
        h = {"<cmd>lua _htop_term_toggle()<CR>", "show htop in a floating terminal"},
        j = {"<cmd>lua _julia_term_toggle()<CR>", "toggle a Julia terminal"},
        l = {Iron.send_line, "send line to REPL"},
        r = {"<cmd>IronRepl<cr>", "open REPL"},
        R = {"<cmd>IronRestart<cr>", "restart REPL"},
        t = {"<cmd>ToggleTerm direction=vertical<CR>", "vertical terminal (can also do <C-\\>)"},
        T = {"<cmd>ToggleTerm direction=horizontal<CR>", "horizontal terminal(can also do <C-\\>)"},
        z = {"<cmd>vs term://zsh<cr>", "open a zsh terminal in a new vertical split"},
    },
}, {prefix="<leader>"})

local function _iron_send_visual()
    Iron.mark_visual()
    Iron.send_mark()
end

local htopterm = Terminal:new({
    cmd = "htop",
    direction = "float",
})

local function _htop_term_toggle() return htopterm:toggle() end

WhichKey.register({
    ["<C-n>"] = {"<cmd>stopinsert!<CR>", "get out of insert mode", noremap=true},
}, {mode="t"})

WhichKey.register({
    r = {_iron_send_visual, "send selected block to REPL"}
}, {prefix="<leader>", mode="v"})

local juliaterm = Terminal:new({
    cmd = "julia",
    direction = "horizontal",
})
function _julia_term_toggle() return juliaterm:toggle() end

