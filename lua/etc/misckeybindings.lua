-- directory stuff
WhichKey.register({
    [","] = {
        name = "filesystem and directory functions",
        p = {":pwd<CR>", "show current working directory", noremap=true},
        d = {":cd %:p:h<CR>:pwd<CR>", "change to directory of current file", noremap=true},
        e = {":cd %:p:h/..<CR>:pwd<CR>", "change to parent directory of current file", noremap=true},
        h = {":cd<CR>:pwd<CR>", "change to home directory", noremap=true},
        J = {":cd -<CR>:pwd<CR>", "change to previous directory", noremap=true},
        a = {":set autochdir!", "toggle auto directory switching", noremap=true},
    }
})

-- REPL and terminal interaction stuff
WhichKey.register({
    r = {
        name = "REPL and terminal interaction",
        l = {":Luapad<CR>", "open a luapad", noremap=true},
    },
}, {prefix="<leader>"})

