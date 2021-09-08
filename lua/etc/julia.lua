vim.g.julia_indent_align_brackets = 1
vim.g.julia_indent_align_funcargs = 1
-- disable tab in favor of Cmp completion, but still works in command mode
vim.g.latex_to_unicode_tab = "command"

WhichKey.register({
    o = {":call julia#toggle_function_blockassign()<CR>", "toggle Julia function block", noremap=true},
}, {prefix="<leader>"})
