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

colors.todo = {fg=colors.background, bg=colors.cyan, bold=true}
colors.boundary = {fg=colors.background, bg=colors.bgdark}

-- main
-- allows transparent background with e.g. compton
vim.api.nvim_set_hl(0, "Normal", {bg=nil, ctermbg=nil, fg=colors.foreground})
vim.api.nvim_set_hl(0, "NonText", {fg=colors.subtle, bg=nil, ctermbg=nil})
vim.api.nvim_set_hl(0, "Identifier", {fg=colors.orange})
vim.api.nvim_set_hl(0, "Constant", {fg=colors.red})
vim.api.nvim_set_hl(0, "Macro", {fg=colors.green})
vim.api.nvim_set_hl(0, "PreProc", {fg=colors.green})
vim.api.nvim_set_hl(0, "PreCondit", {fg=colors.green})
vim.api.nvim_set_hl(0, "Define", {fg=colors.pink})
vim.api.nvim_set_hl(0, "StorageClass", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Function", {fg=colors.purple})
vim.api.nvim_set_hl(0, "Comment", {fg=colors.comment})
vim.api.nvim_set_hl(0, "Operator", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Delimiter", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Type", {fg=colors.cyan})
vim.api.nvim_set_hl(0, "Tag", {fg=colors.cyan})
vim.api.nvim_set_hl(0, "Typedef", {fg=colors.pink})
vim.api.nvim_set_hl(0, "String", {fg=colors.yellow})
vim.api.nvim_set_hl(0, "Conditional", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Structure", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Repeat", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Special", {fg=colors.orange})
vim.api.nvim_set_hl(0, "Statement", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Include", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Keyword", {fg=colors.pink})
vim.api.nvim_set_hl(0, "MatchParen", {bg=colors.comment})
vim.api.nvim_set_hl(0, "Exception", {fg=colors.pink})
vim.api.nvim_set_hl(0, "Error", {fg=colors.red, bold=true})
vim.api.nvim_set_hl(0, "Search", {fg=colors.green, underline=true})
vim.api.nvim_set_hl(0, "IncSearch", {underline=true})
vim.api.nvim_set_hl(0, "CurSearch", {fg=colors.green, bold=true, underline=true})
vim.api.nvim_set_hl(0, "Todo", colors.todo)

-- treesitter additional
vim.api.nvim_set_hl(0, "@parameter", {fg=colors.foreground})
vim.api.nvim_set_hl(0, "@field", {fg=colors.foreground})
vim.api.nvim_set_hl(0, "@constructor", {fg=colors.pink})
vim.api.nvim_set_hl(0, "@namespace", {fg=colors.foreground})
vim.api.nvim_set_hl(0, "@label", {fg=colors.orange})

vim.api.nvim_set_hl(0, "@function.builtin", {link="Function"})
vim.api.nvim_set_hl(0, "@variable.builtin", {fg=colors.red})
vim.api.nvim_set_hl(0, "@constant.builtin", {fg=colors.red})


--linkhighlight("Number", "Constant")
vim.api.nvim_set_hl(0, "Number", {link="Constant"})
vim.api.nvim_set_hl(0, "Boolean", {link="Constant"})
vim.api.nvim_set_hl(0, "Float", {link="Constant"})
vim.api.nvim_set_hl(0, "Character", {link="Constant"})

-- obscure stuff
vim.api.nvim_set_hl(0, "StatusLine", {fg=nil, bg=colors.bglighter, bold=true})
vim.api.nvim_set_hl(0, "StatusLineNC", {fg=nil, bg=colors.bglight})
vim.api.nvim_set_hl(0, "StatusLineTerm", {fg=nil, bg=colors.bglighter, bold=true})
vim.api.nvim_set_hl(0, "StatusLineTermNC", {fg=nil, bg=colors.bglight})
vim.api.nvim_set_hl(0, "WildMenu", {fg=colors.background, bg=colors.purple, bold=true})
vim.api.nvim_set_hl(0, "CursorLine", {fg=nil, bg=nil})
vim.api.nvim_set_hl(0, "ColorColumn", {bg=colors.bgdark})
vim.api.nvim_set_hl(0, "CursorLineNr", {fg=colors.yellow})
vim.api.nvim_set_hl(0, "DiffAdd", {fg=colors.green})
vim.api.nvim_set_hl(0, "DiffChange", {fg=colors.orange})
vim.api.nvim_set_hl(0, "DiffDelete", {fg=colors.red, bg=colors.bgdark})
vim.api.nvim_set_hl(0, "DiffText", {fg=colors.background, bg=colors.orange})
vim.api.nvim_set_hl(0, "Directory", {fg=colors.purple, bold=true})
vim.api.nvim_set_hl(0, "ErrorMsg", {fg=colors.red, bold=true})
vim.api.nvim_set_hl(0, "FoldColumn", {fg=colors.subtle})
vim.api.nvim_set_hl(0, "Folded", {fg=colors.comment, bg=colors.bgdark})
vim.api.nvim_set_hl(0, "LineNr", {fg=colors.comment})
vim.api.nvim_set_hl(0, "MoreMsg", {fg=colors.foreground, bold=true})
vim.api.nvim_set_hl(0, "Pmenu", {bg=colors.bgdark})
vim.api.nvim_set_hl(0, "PmenuSbar", {bg=colors.bgdark})
vim.api.nvim_set_hl(0, "PmenuSel", {fg=colors.foreground, bg=colors.selection})
vim.api.nvim_set_hl(0, "PmenuThumb", {fg=colors.foreground, bg=colors.selection})
vim.api.nvim_set_hl(0, "Question", {fg=colors.foreground, bold=true})
vim.api.nvim_set_hl(0, "SignColumn", {fg=colors.comment})
vim.api.nvim_set_hl(0, "TabLine", colors.boundary)
vim.api.nvim_set_hl(0, "TabLineFill", {bg=colors.bgdarker})
vim.api.nvim_set_hl(0, "Title", {fg=colors.green, bold=true})
vim.api.nvim_set_hl(0, "VertSplit", colors.boundary)
vim.api.nvim_set_hl(0, "Visual", {fg=nil, bg=colors.selection})
vim.api.nvim_set_hl(0, "WarningMsg", {fg=colors.orange, reverse=true})
vim.api.nvim_set_hl(0, "SpecialKey", {fg=colors.pink})
vim.api.nvim_set_hl(0, "FoldColumn", {fg=nil, bg=colors.background})
vim.api.nvim_set_hl(0, "SignColumn", {bg=colors.background})  -- icons next to number column
vim.api.nvim_set_hl(0, "LineNr", {fg=colors.subtle})  -- line numbers
vim.api.nvim_set_hl(0, "EndOfBuffer", {fg=colors.background, bg=nil})  -- tildes past end of buffer; good to disable if using numbers
vim.api.nvim_set_hl(0, "TabLineFill", {fg=colors.bgdark, bg=colors.bgdark})
vim.api.nvim_set_hl(0, "StatusLine", {fg=colors.bgdark, bg=colors.bgdark})
--vim.api.nvim_set_hl(0, "StatusLineNC", {fg=colors.bgdark, bg=colors.bgdark})
vim.api.nvim_set_hl(0, "Conceal", {fg=colors.cyan, bg=nil})  -- for our case, these are abbreviated latex
vim.api.nvim_set_hl(0, "SpellBad", {fg=colors.orange, underline=true})
vim.api.nvim_set_hl(0, "DiffAdd", {fg=colors.green, bg=colors.purple})
vim.api.nvim_set_hl(0, "DiffChange", {fg=colors.pink, bg=colors.black})
vim.api.nvim_set_hl(0, "DiffDelete", {fg=colors.red, bg=colors.black})
vim.api.nvim_set_hl(0, "DiffText", {fg=colors.background, bg=colors.orange})

-- links
vim.api.nvim_set_hl(0, "CursorColumn", {link="CursorLine"})
vim.api.nvim_set_hl(0, "DiffAdded", {link="DiffAdd"})
vim.api.nvim_set_hl(0, "DiffRemoved", {link="DiffDelete"})
vim.api.nvim_set_hl(0, "TabLineSel", {link="Normal"})
vim.api.nvim_set_hl(0, "VisualNOS", {link="Visual"})

-- compe specific link
vim.api.nvim_set_hl(0, "CompeDocumentation", {link="NormalFloat"})

-- LSP
vim.api.nvim_set_hl(0, "LspReferenceText", {fg=nil, bg=colors.selection})
vim.api.nvim_set_hl(0, "LspReferenceRead", {fg=nil, bg=colors.selection})
vim.api.nvim_set_hl(0, "LspReferenceWrite", {fg=nil, bg=colors.selection})
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultInformation", {fg=colors.cyan})
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultHint", {fg=colors.cyan})
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", {fg=colors.red})
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", {fg=colors.orange})
vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineError", {fg=colors.red, underline=true})
vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineHint", {fg=colors.cyan, underline=true})
vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineInformation", {fg=colors.cyan, underline=true})
vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineWarning", {fg=colors.orange, underline=true})

-- misc

-- no idea why comments are wrong by default in rust, but they are
vim.api.nvim_set_hl(0, "rustCommentLineDoc", {fg=colors.comment})

-- this will also make 1-line function defs purple
vim.api.nvim_set_hl(0, "juliaFunctionCall", {fg=colors.purple})
vim.api.nvim_set_hl(0, "juliaSemiColon", {fg=colors.pink})

-- some zig stuff because the default highlight groups are wierd
vim.api.nvim_set_hl(0, "zigVarDecl", {link="Keyword"})
vim.api.nvim_set_hl(0, "zigExecution", {link="Keyword"})

-- nvim-cmp related
vim.api.nvim_set_hl(0, "CmpItemKind", {fg=colors.cyan})
vim.api.nvim_set_hl(0, "CmpItemMenu", {fg=colors.orange})
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", {fg=colors.comment})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", {fg=colors.green})
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {fg=colors.yellow})

-- latex
vim.api.nvim_set_hl(0, "texFilesArg", {fg=colors.foreground})
