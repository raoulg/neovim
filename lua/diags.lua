
WhichKey = require("which-key")

WhichKey.register({
  ["["] = {
    name = "goto next",
    d = {vim.diagnostic.goto_next, "next diagnostics"},
  },
  ["]"] = {
    name = "goto prev",
    d = {vim.diagnostic.goto_prev, "previous diagnostic"},
  },
})

WhichKey.register({
  d = {
    name = "diagnostic",
    p = {vim.diagnostic.goto_prev, "previous diagnostic"},
    d = {vim.diagnostic.goto_next, "next diagnostics"},
    e = {vim.diagnostic.open_float, "diagnostic open float"},
    q = {vim.diagnostic.setloclist, "diagnostic set loclist"},
  },
}, {prefix="<leader>"})

