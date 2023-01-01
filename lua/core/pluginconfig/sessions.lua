local AutoSession = require("auto-session")

AutoSession.setup({
    log_level = "error",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data").."/sessions/",
    auto_session_enabled = false,
    auto_save_enabled = false,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {},

})

WhichKey.register({

    s = {
        name = "session management",
        s = {"<cmd>SaveSession<CR>", "save the current session", noremap=true},
        -- S = {":SaveSession ", "save session in specified directory path", noremap=true, expr=true},
        x = {"<cmd>DeleteSession<CR>", "delete session for current path", noremap=true},
        -- X = {"<cmd>DeleteSession ", "delete session for specified directory path", noremap=true},

    },

}, {prefix="<leader>"})
