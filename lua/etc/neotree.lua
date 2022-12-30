Neotree = require("neo-tree")

Neotree.setup({
    close_if_last_window = true,
    hijack_netrw_behavior = "open_default",
    buffers = {
          follow_current_file = true,
  }

})

WhichKey = require("which-key")

WhichKey.register({
  n = {"<cmd>Neotree toggle<CR>", "Neotree"},

}, {prefix="<leader>"})
