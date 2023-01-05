WhichKey.register({
    h = {
        name = "harpoon",
        a = {"<cmd>lua require'harpoon.mark'.add_file()<CR>", "Add file"},
        m = {"<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>", "Toggle quick menu"},
        h = {"<cmd>Telescope harpoon marks<CR>", "Fuzzy find harpoon marks"},
        ["1"] = {"<cmd>lua require'harpoon.ui'.nav_file(1)<CR>", "Goto file 1"},
        ["2"] = {"<cmd>lua require'harpoon.ui'.nav_file(2)<CR>", "Goto file 2"},
        ["3"] = {"<cmd>lua require'harpoon.ui'.nav_file(3)<CR>", "Goto file 3"},
        ["4"] = {"<cmd>lua require'harpoon.ui'.nav_file(4)<CR>", "Goto file 4"},

    }
}, {prefix="<leader>"})

WhichKey.register({
    ["]h"] = {"<cmd>lua require'harpoon.ui'.nav_next()<CR>", "next harpoon"},
    ["[h"] = {"<cmd>lua require'harpoon.ui'.nav_prev()<CR>", "previous harpoon"},

})
