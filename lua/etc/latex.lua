vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmg"
vim.g.vimtex_mappings_enabled = false  -- don't define default keybindings for vimtex

WhichKey.register({
    l = {
        name = "LaTeX commands",
        i = {"<cmd>VimtexInfo<CR>", "show latex info", noremap=true},
        I = {"<cmd>VimtexInfoFull<CR>", "show full latex info", noremap=true},
        t = {"<cmd>VimtexTocOpen<CR>", "open latex table of contents", noremap=true},
        T = {"<cmd>VimtexTocToggle<CR>", "toggle latex table of contents", noremap=true},
        q = {"<cmd>VimtexLog<CR>", "show latex compiler log", noremap=true},
        v = {"<cmd>VimtexView<CR>", "view latex output", noremap=true},
        l = {"<cmd>VimtexCompile<CR>", "start latex compilation", noremap=true},
        L = {"<cmd>VimtexCompileSelected<CR>", "start latex compilation for selection", noremap=true},
        k = {"<cmd>VimtexStop<CR>", "stop latex compilation", noremap=true},
        K = {"<cmd>VimtexStopAll<CR>", "stop all latex compilation", noremap=true},
        e = {"<cmd>VimtexErrors<CR>", "show latex compilation errors", noremap=true},
        o = {"<cmd>VimtexCompileOutput<CR>", "open file where compiler is redirected", noremap=true},
        g = {"<cmd>VimtexStatus<CR>", "show latex compiler status", noremap=true},
        G = {"<cmd>VimtexStatusAll<CR>", "show latex compiler status for all", noremap=true},
        c = {"<cmd>VimtexClean<CR>", "clean latex output", noremap=true},
        C = {"<cmd>VimtexCleanAll<CR>", "clean all latex output", noremap=true},
        x = {"<cmd>VimtexReload<CR>", "reload vimtex", noremap=true},
        a = {"<cmd>VimtexContextMenu<CR>", "open latex context menu", noremap=true},

        u = {":call LaTeXtoUnicode#Toggle()<CR>", "toggle latex-to-unicode", noremap=true},
    }
}, {prefix="<leader>"})


-- tex is another of those things that has very unique syntax, so we define highlights here
sethighlight("texBeginEndName", {fg=colors.orange, style="italic"})
sethighlight("texBoldItalStyle", {fg=colors.orange, style="bold,italic"})
sethighlight("texBoldStyle", {fg=colors.orange, style="bold"})
sethighlight("texInputFile", {fg=colors.orange, style="italic"})
sethighlight("texStyleItal", {fg=colors.yellow, style="italic"})
sethighlight("texLigature", {fg=colors.purple})
sethighlight("texMath", {fg=colors.red})
sethighlight("texMathMatcher", {fg=colors.red})
sethighlight("texMathSymbol", {fg=colors.cyan})
sethighlight("texSpecialChar", {fg=colors.purple})
sethighlight("texSubscripts", {fg=colors.pink})
sethighlight("texTitle", {fg=colors.foreground, style="bold"})
