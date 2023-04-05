require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

WhichKey.register({
  n = { "<cmd>NvimTreeToggle<CR>", "Toggle nvimtree" },
  s = {"<cmd>lua require'nvim-tree.api'.marks.list()<CR>", "List marks"},
  -- s = { "lua require("nvim-tree.api").marks.list()", "show bookmarks"},
}, { prefix = "<leader>" })
