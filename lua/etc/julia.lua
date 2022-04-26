vim.g.julia_indent_align_brackets = 1
vim.g.julia_indent_align_funcargs = 1
-- disable tab in favor of Cmp completion, but still works in command mode
-- TODO: this is temporarily disabled because it partially breaks wilder.nvim
-- see https://github.com/JuliaEditorSupport/julia-vim/issues/291
--vim.g.latex_to_unicode_tab = "command"
vim.g.latex_to_unicode_tab = "off"

WhichKey.register({
    o = {":call julia#toggle_function_blockassign()<CR>", "toggle Julia function block", noremap=true},
}, {prefix="<leader>"})
