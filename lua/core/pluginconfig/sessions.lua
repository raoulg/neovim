-- local AutoSession = require("auto-session")
--
-- AutoSession.setup({
--     log_level = "error",
--     auto_session_enable_last_session = false,
--     auto_session_root_dir = vim.fn.stdpath("data").."/sessions/",
--     auto_session_enabled = false,
--     auto_save_enabled = false,
--     auto_restore_enabled = false,
--     auto_session_suppress_dirs = {},
--
-- })

vim.keymap.set({ 'n' }, '<leader>ss', ':PossessionSave<CR>', { silent = false })
vim.keymap.set({ 'n' }, '<leader>sS', ':PossessionSave ', { silent = false })
vim.keymap.set({ 'n' }, '<leader>sl', ':PossessionLoad<CR>', { silent = false })
vim.keymap.set({ 'n' }, '<leader>sd', ':PossessionDelete<CR>', { silent = false })
vim.keymap.set({ 'n' }, '<leader>sf', ':Telescope possession list<CR>', { silent = false })

WhichKey.register({

    s = {
        name = "session management",
        -- s = {"<cmd>SaveSession<CR>", "save the current session", noremap=true},
        -- x = {"<cmd>DeleteSession<CR>", "delete session for current path", noremap=true},
        -- X = {"<cmd>DeleteSession ", "delete session for specified directory path", noremap=true},
    },

}, {prefix="<leader>"})

-- require("persisted").setup()
-- require("telescope").load_extension("persisted")
--
require("possession").setup({
    hooks = {
        before_save = function(name)
            vim.cmd[[NeoTreeClose]]
            return {}
        end,
    },
})
require("telescope").load_extension("possession")
