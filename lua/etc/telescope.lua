local Telescope = require("telescope")
local Sorters = require("telescope/sorters")
local Previewers = require("telescope/previewers")

-- TODO make sure dotfiles can install bat

Telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        prompt_prefix = "◗ ",
        selection_caret = "◗ ", 
        entry_prefix = " ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            --horizontal = {width=0.8, mirror=false},
            --vertical = {width=0.8, mirror=false},
        },
        file_sorter = Sorters.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = Sorters.get_generic_fuzzy_sorter,
        winblend = 0,
        results_hight = 42,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = {['COLORTERM'] = 'truecolor'},
        file_previewer = Previewers.vim_buffer_cat.new,
        grep_previewer = Previewers.vim_buffer_vimgrep.new,
        qflist_previewer = Previewers.vim_buffer_qflist.new,
    }
})

WhichKey.register({
    name = "search",
    ["\\"] = {"<cmd>Telescope live_grep<CR>", "live grep"},
    f = {"<cmd>Telescope find_files<CR>", "find files"},
    b = {"<cmd>Telescope buffers<CR>", "search buffers"},
    h = {"<cmd>Telescope help_tags<CR>", "search help tags"},
    k = {"<cmd>Telescope keymaps<CR>", "search key mappings"},
    q = {"<cmd>Telescope current_buffer_fuzzy_find<CR>", "search current buffer"},
    c = {"<cmd>Telescope commands<CR>", "search vim commands"},
    l = {"<cmd>Telescope lsp_references<CR>", "search LSP references"},
    d = {"<cmd>Telescope lsp_definitions<CR>", "search LSP definitions"},
    w = {"<cmd>Telescope highlights<CR>", "search nvim highlight groups"},
    r = {"<cmd>Telescope registers<CR>", "search vim registers"},
    s = {"<cmd>SearchSession<CR>", "search sessions"},
    o = {"<cmd>Telescope grep_string<cr>", "search for string under cursor"},
    m = {"<cmd>Telescope marks<cr>", "search marks"},
    V = {"<cmd>Telescope vim_options<cr>", "search vim options"},
}, {prefix="\\", noremap=true})

-- appearance
vim.api.nvim_set_hl(0, "TelescopeBorder", {fg=colors.pink, bg=nil})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg=colors.cyan, bg=nil})
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {fg=colors.pink, bg=nil})
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {fg=colors.purple, bg=nil})
