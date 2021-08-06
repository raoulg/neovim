vim.cmd("hi clear")  -- make sure we are starting with defaults

vim.g.colors_name = "dracula"


-- good reference at https://www.material-theme.com/docs/reference/color-palette/
-- but it has a slightly different dracula theme

-- dracula color scheme
colors = {
    background = "#282a36",
    selection = "#44475a",
    foreground = "#f8f8f2",
    comment = "#6272a4",
    cyan = "#8be9fd",
    green = "#50fa7b",
    orange = "#ffb86c",
    blue = "#79cbdc",   -- note this is really close to cyan
    pink = "#ff79c6",
    purple = "#bd93f9",
    red = "#ff5555",
    yellow = "#f1fa8c",
    subtle = "#424450",
    bglight = "#343746",
    bglighter = "#424450",
    bgdark = "#21222c",
    bgdarker = "#191a21",
    black = "#000000",
}

colors.todo = {fg=colors.background, bg=colors.cyan, style="bold"}
colors.boundary = {fg=colors.background, bg=colors.bgdark}

-- allows transparent background with e.g. compton
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")

-- main
sethighlight("Normal", {fg=colors.foreground})
sethighlight("Identifier", {fg=colors.orange})
sethighlight("Constant", {fg=colors.red})
sethighlight("Macro", {fg=colors.green})
sethighlight("PreProc", {fg=colors.pink})
sethighlight("PreCondit", {fg=colors.pink})
sethighlight("Define", {fg=colors.pink})
sethighlight("StorageClass", {fg=colors.pink})
sethighlight("Function", {fg=colors.purple})
sethighlight("Comment", {fg=colors.comment})
sethighlight("Operator", {fg=colors.pink})
sethighlight("Delimiter", {fg=colors.foreground})
sethighlight("Type", {fg=colors.cyan})
sethighlight("Tag", {fg=colors.cyan})
sethighlight("Typedef", {fg=colors.pink})
sethighlight("String", {fg=colors.yellow})
sethighlight("Conditional", {fg=colors.pink})
sethighlight("Structure", {fg=colors.pink})
sethighlight("Repeat", {fg=colors.pink})
sethighlight("Special", {fg=colors.orange})
sethighlight("Statement", {fg=colors.pink})
sethighlight("Include", {fg=colors.pink})
sethighlight("Keyword", {fg=colors.pink})
sethighlight("MatchParen", {bg=colors.comment})
sethighlight("Exception", {fg=colors.pink})
sethighlight("Error", {fg=colors.red, style="bold"})
sethighlight("Search", {bg=colors.green, bg=colors.bgdark, style="underline"})
sethighlight("IncSearch", {fg=colors.green, bg=colors.bgdark, style="underline"})
sethighlight("Todo", colors.todo)

linkhighlight("Number", "Constant")
linkhighlight("Boolean", "Constant")
linkhighlight("Float", "Constant")
linkhighlight("Character", "Constant")

-- obscure stuff
sethighlight("StatusLine", {fg="NONE", bg=colors.bglighter, style="bold"})
sethighlight("StatusLineNC", {fg="NONE", bg=colors.bglight})
sethighlight("StatusLineTerm", {fg="NONE", bg=colors.bglighter, style="bold"})
sethighlight("StatusLineTermNC", {fg="NONE", bg=colors.bglight})
sethighlight("WildMenu", {fg=colors.background, bg=colors.purple, style="bold"})
sethighlight("CursorLine", {fg="NONE", bg="NONE"})
sethighlight("ColorColumn", {bg=colors.bgdark})
sethighlight("CursorLineNr", {fg=colors.yellow})
sethighlight("DiffAdd", {fg=colors.green})
sethighlight("DiffChange", {fg=colors.orange})
sethighlight("DiffDelete", {fg=colors.red, bg=colors.bgdark})
sethighlight("DiffText", {fg=colors.background, bg=colors.orange})
sethighlight("Directory", {fg=colors.purple, style="bold"})
sethighlight("ErrorMsg", {fg=colors.foreground, bg=colors.red})
sethighlight("FoldColumn", {fg=colors.subtle})
sethighlight("Folded", {fg=colors.comment, bg=colors.bgdark})
sethighlight("LineNr", {fg=colors.comment})
sethighlight("MoreMsg", {fg=colors.foreground, style="bold"})
sethighlight("NonText", {fg=colors.subtle})
sethighlight("Pmenu", {bg=colors.bgdark})
sethighlight("PmenuSbar", {bg=colors.bgdark})
sethighlight("PmenuSel", {fg=colors.foreground, bg=colors.selection})
sethighlight("PmenuThumb", {fg=colors.foreground, bg=colors.selection})
sethighlight("Question", {fg=colors.foreground, style="bold"})
sethighlight("Seach", {fg=colors.green, style="standout"})
sethighlight("SignColumn", {fg=colors.comment})
sethighlight("TabLine", colors.boundary)
sethighlight("TabLineFill", {bg=colors.bgdarker})
sethighlight("Title", {fg=colors.green, style="bold"})
sethighlight("VertSplit", colors.boundary)
sethighlight("Visual", {fg="NONE", bg=colors.selection})
sethighlight("WarningMsg", {fg=colors.orange, style="inverse"})
sethighlight("SpecialKey", {fg=colors.pink})
sethighlight("FoldColumn", {fg="NONE", bg=colors.background})
sethighlight("SignColumn", {bg=colors.background})  -- icons next to number column
sethighlight("LineNr", {fg=colors.subtle})  -- line numbers
sethighlight("EndOfBuffer", {fg=colors.background, bg="NONE"})  -- tildes past end of buffer; good to disable if using numbers
sethighlight("TabLineFill", {fg=colors.bgdark, bg=colors.bgdark})
sethighlight("StatusLine", {fg=colors.bgdark, bg=colors.bgdark})
sethighlight("StatusLineNC", {fg=colors.bgdark, bg=colors.bgdark})
sethighlight("Conceal", {fg=colors.cyan, bg="NONE"})  -- for our case, these are abbreviated latex
sethighlight("SpellBad", {fg=colors.orange, style="underline"})
sethighlight("DiffAdd", {fg=colors.green, bg=colors.purple})
sethighlight("DiffChange", {fg=colors.pink, bg=colors.black})
sethighlight("DiffDelete", {fg=colors.red, bg=colors.black})
sethighlight("DiffText", {fg=colors.background, bg=colors.orange})

-- links
linkhighlight("CursorColumn", "CursorLine")
linkhighlight("DiffAdded", "DiffAdd")
linkhighlight("DiffRemoved", "DiffDelete")
linkhighlight("TabLineSel", "Normal")
linkhighlight("VisualNOS", "Visual")

-- compe specific link
linkhighlight("CompeDocumentation", "NormalFloat")

-- LSP
sethighlight("LspReferenceText", {fg="NONE", bg=colors.selection})
sethighlight("LspReferenceRead", {fg="NONE", bg=colors.selection})
sethighlight("LspReferenceWrite", {fg="NONE", bg=colors.selection})
sethighlight("LspDiagnosticsDefaultInformation", {fg=colors.cyan})
sethighlight("LspDiagnosticsDefaultHint", {fg=colors.cyan})
sethighlight("LspDiagnosticsDefaultError", {fg=colors.red})
sethighlight("LspDiagnosticsDefaultWarning", {fg=colors.orange})
sethighlight("LspDiagnosticsUnderlineError", {fg=colors.red, style="underline"})
sethighlight("LspDiagnosticsUnderlineHint", {fg=colors.cyan, style="underline"})
sethighlight("LspDiagnosticsUnderlineInformation", {fg=colors.cyan, style="underline"})
sethighlight("LspDiagnosticsUnderlineWarning", {fg=colors.orange, style="underline"})
