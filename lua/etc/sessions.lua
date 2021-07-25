local AutoSession = require("auto-session")

AutoSession.setup({
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data").."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = {},
})

WhichKey.register({
    s = {
        name = "session management",
        s = {"<cmd>SaveSession<CR>", "save the current session", noremap=true},
        S = {"<cmd>SaveSession", "save session in specified directory path", noremap=true},
        l = {"<cmd>RestoreSession<CR>", "load session for current path", noremap=true},
        L = {"<cmd>RestoreSession", "load session from specified directory path", noremap=true},
        x = {"<cmd>DeleteSession<CR>", "delete session for current path", noremap=true},
        X = {"<cmd>DeleteSession", "delete session for specified directory path", noremap=true},
    },
}, {prefix="<leader>"})
