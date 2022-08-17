Leap = require("leap")

Leap.setup {
    max_aot_targets = nil,
    highlight_unlabeled = true,
}

Leap.set_default_keymaps()

vim.api.nvim_set_hl(0, "LeapBackdrop", {fg=colors.subtle})
vim.api.nvim_set_hl(0, "LeapMatch", {fg=colors.green, underline=true})
vim.api.nvim_set_hl(0, "LeapLabelPrimary", {fg=colors.pink, bold=true})
vim.api.nvim_set_hl(0, "LeapLabelSecondary", {fg=colors.pink})
vim.api.nvim_set_hl(0, "LeapLabelSelected", {fg=colors.pink, reverse=true})
