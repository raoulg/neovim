
-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}


WhichKey = require("which-key")

WhichKey.register({
    g = {
        name = "Git",
        g = {"<cmd>TermExec cmd=\"gitui\" direction=float<CR>", "Open gitui in a floating terminal"},
        d = {"<cmd>DiffviewOpen<CR>", "Open diffview"},

    },
}, {prefix="<leader>"})

WhichKey.register({
  ["]c"] = {"<cmd>Gitsigns next_hunk<CR>", "next change"},
  ["[c"] = {"<cmd>Gitsigns prev_hunk<CR>", "previous change"},
})



