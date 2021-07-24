
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_header = {"ħ = c = 1"}
vim.g.dashboard_custom_footer = {}

vim.g.dashboard_custom_shortcut = {
    last_session = "<space>sl",
    find_history = "<space>sh",
    find_file = "<space>sf",
    new_file = "<space>sn",
    change_colorscheme = "<space>sc",
    find_word = "<space>sw",
    book_marks = "<space>sb",
},

-- this sets the dashboard session directory which defaults to ~/.cache/vim/session
--vim.g.dashboard_session_directory = ""

WhichKey.register({
    s = {
        name = "manage sessions or other dashboard stuff",
        s = {"<cmd>SessionSave<CR>", "save the session", noremap=true},
        l = {"<cmd>SessionLoad<CR>", "load a session", noremap=true},
        h = {"<cmd>DashboardFindHistory<CR>", "find dashboard history", noremap=true},
        f = {"<cmd>DashboardFindFile<CR>", "dashboard find file", noremap=true},
        c = {"<cmd>DashboardChangeColorscheme<CR>", "dashboard change colorscheme", noremap=true},
        w = {"<cmd>DashboardFindWord<CR>", "dashboard find word", noremap=true},
        b = {"<cmd>DashboardJumpMark<CR>", "dashboard jump to mark", noremap=true},
        n = {"<cmd>DashboardNewFile<CR>", "dashboard new file", noremap=true},
    },
}, {prefix="<leader>"})


sethighlight("DashboardHeader", {fg=colors.red, style="italic"})
sethighlight("DashboardCenter", {fg=colors.yellow})
sethighlight("DashboardShortcut", {fg=colors.pink})
sethighlight("DashboardFooter", {fg=colors.purple})

--TODO: need more commands for clearing sessions and shit like that
