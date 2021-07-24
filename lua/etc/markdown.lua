vim.g.vim_markdown_folding_disabled = 1

-- we have to manually set colors for markdown because the highlight groups are so weird
-- this is mostly taken from https://github.com/dracula/vim/blob/master/after/syntax/markdown.vim
sethighlight("htmlBold", {fg=colors.orange, style="bold"})
sethighlight("htmlBoldItalic", {fg=colors.orange, style="bold,italic"})
sethighlight("htmlH1", {fg=colors.purple, style="bold"})
sethighlight("htmlItalic", {fg=colors.yellow, style="italic"})
sethighlight("mkdBlockquote", {fg=colors.yellow, style="italic"})
sethighlight("mkdBold", {fg=colors.orange, style="bold"})
sethighlight("mkdBoldItalic", {fg=colors.orange, style="bold,italic"})
sethighlight("mkdCode", {fg=colors.green})
sethighlight("mkdCodeEnd", {fg=colors.green})
sethighlight("mkdCodeStart", {fg=colors.green})
sethighlight("mkdHeading", {fg=colors.purple, style="bold"})
sethighlight("mkdInlineUrl", {fg=colors.cyan, style="underline"})
sethighlight("mkdItalic", {fg=colors.yellow, style="italic"})
sethighlight("mkdLink", {fg=colors.pink})
sethighlight("mkdListItem", {fg=colors.cyan})
sethighlight("mkdRule", {fg=colors.comment})
sethighlight("mkdUrl", {fg=colors.cyan, style="underline"})
