vim.g.vim_markdown_folding_disabled = 1

-- display quarto as markdown because don't have highlighting elsewhere
vim.api.nvim_create_autocmd("BufEnter", {
    pattern={"*.qmd"},
    callback=function(arg)
        vim.api.nvim_buf_set_option(arg.buf, "filetype", "markdown")
    end,
})

-- we have to manually set colors for markdown because the highlight groups are so weird
-- this is mostly taken from https://github.com/dracula/vim/blob/master/after/syntax/markdown.vim
vim.api.nvim_set_hl(0, "htmlBold", {fg=colors.orange, bold=true})
vim.api.nvim_set_hl(0, "htmlBoldItalic", {fg=colors.orange, bold=true, italic=true})
vim.api.nvim_set_hl(0, "htmlH1", {fg=colors.purple, bold=true})
vim.api.nvim_set_hl(0, "htmlItalic", {fg=colors.yellow, italic=true})
vim.api.nvim_set_hl(0, "mkdBlockquote", {fg=colors.yellow, italic=true})
vim.api.nvim_set_hl(0, "mkdBold", {fg=colors.orange, bold=true})
vim.api.nvim_set_hl(0, "mkdBoldItalic", {fg=colors.orange, bold=true, italic=true})
vim.api.nvim_set_hl(0, "mkdCode", {fg=colors.green})
vim.api.nvim_set_hl(0, "mkdCodeEnd", {fg=colors.green})
vim.api.nvim_set_hl(0, "mkdCodeStart", {fg=colors.green})
vim.api.nvim_set_hl(0, "mkdHeading", {fg=colors.purple, bold=true})
vim.api.nvim_set_hl(0, "mkdInlineUrl", {fg=colors.cyan, underline=true})
vim.api.nvim_set_hl(0, "mkdItalic", {fg=colors.yellow, italic=true})
vim.api.nvim_set_hl(0, "mkdLink", {fg=colors.pink})
vim.api.nvim_set_hl(0, "mkdListItem", {fg=colors.cyan})
vim.api.nvim_set_hl(0, "mkdRule", {fg=colors.comment})
vim.api.nvim_set_hl(0, "mkdUrl", {fg=colors.cyan, underline=true})
