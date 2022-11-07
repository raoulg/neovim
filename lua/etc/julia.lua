vim.g.julia_indent_align_brackets = 1
vim.g.julia_indent_align_funcargs = 1
vim.g.latex_to_unicode_tab = "cmd"
vim.g.latex_to_unicode_auto = 1

WhichKey.register({
    o = {":call julia#toggle_function_blockassign()<CR>", "toggle Julia function block", noremap=true},
}, {prefix="<leader>"})
