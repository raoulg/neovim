local Jqx = require("nvim-jqx")

--NOTE: use JqxList for a nice JSON navigator, but I don't want to waste a keybinding on it

vim.api.nvim_set_hl(0, "jsonKeyword", {fg=colors.cyan})
vim.api.nvim_set_hl(0, "jsonKeywordMatch", {fg=colors.pink})
vim.api.nvim_set_hl(0, "jsonQuote", {fg=colors.yellow})
vim.api.nvim_set_hl(0, "jsonBraces", {fg=colors.pink})
