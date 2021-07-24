vim.g.UltiSnipsSnippetDirectories = {"UltiSnips",}
vim.g.UltiSnipsExpandTrigger = "<C-j>"

-- ensure these aren't doing any weird shenanigans
vim.api.nvim_set_keymap("i", "<C-j>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-k>", "<nop>", {})

vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
