local Todo = require("todo-comments")

Todo.setup({
    signs = true,
    sign_priority = 8,
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FUCK", "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "TEMP" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    gui_style = {fg="NONE", bg="ITALIC"},
    merge_keyword = true,
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide" or empty
        after = "", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
        -- this used to work for non-treesitter but not anymore...
        -- therefore keeping it disabled while I don't have Julia treesitter
        comments_only = false,
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
    },
    colors = {
        error = {"LspDiagnosticsDefaultError", "ErrorMsg"},
        warning = {"LspDiagnosticsDefaultWarning", "WarningMsg"},
        info = {"LspDiagnosticsDefaultInformation", "#2563EB" },
        hint = {"LspDiagnosticsDefaultHint"},
        default = { "Identifier"}
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    }
})

WhichKey.register({
    y = {
        name = "TODO management",
        q = {"<cmd>TodoQuickFix<CR>", "bring up quick fix list", noremap=true},
        f = {"<cmd>TodoTelescope<CR>", "telescope search for TODO and FIX notices", noremap=true},
    }
}, {prefix="<leader>"})
