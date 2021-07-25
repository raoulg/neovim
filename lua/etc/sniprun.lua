local SnipRun = require("sniprun")

SnipRun.setup({
    display = {"VirtualTextOk", "VirtualTextErr"}
})

WhichKey.register({
    z = {
        name = "running and compilation",
        l = {SnipRun.run, "run the current line", noremap=true},
        v = {function() SnipRun.run("v") end, "run current selection (better do `:Sniprun` form visual)", noremap=true},
        i = {SnipRun.info, "show SnipRun info", noremap=true},
        r = {SnipRun.reset, "reset SnipRun", noremap=true},
        m = {SnipRun.clear_repl, "clear SnipRun REPL memory", noremap=true},
        x = {SnipRun.close, "close SnipRun", noremap=true},
    }
}, {prefix="<leader>"})


sethighlight("SniprunVirtualTextOk", {bg=colors.green, fg=colors.bgdark})
sethighlight("SniprunFloatingWindowOk", {fg=colors.green, bg=colors.background})
sethighlight("SniprunVirtualTextErr", {bg=colors.red, fg=colors.bgdark})
sethighlight("SniprunFloatingWinErr", {fg=colors.red, bg=colors.background})
