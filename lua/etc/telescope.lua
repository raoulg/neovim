
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

WhichKey = require("which-key")

WhichKey.register({
  f = {
    name = "Find everything",
    f = {"<cmd>Telescope find_files<CR>", "Find files"},
    r = {"<cmd>Telescope oldfiles<CR>", "Find recent files"},
    b = {"<cmd>Telescope buffers<CR>", "Find recent buffers"},
    h = {"<cmd>Startify<CR>", "Home buffer"},
    t = {"<cmd>TodoTelescope<CR>", "Search todos"},
    H = {"<cmd>Telescope help_tags<CR>", "Search help"},
    w = {"<cmd>Telescope grep_string<CR>", "Search current word"},
    g = {"<cmd>Telescope live_grep<CR>", "Grep"},
    d = {"<cmd>Telescope diagnostics<CR>", "Search diagnostics"},
    k = {"<cmd>Telescope keymaps<CR>", "Search keymaps"},
    s = {"<cmd>Telescope session-lens search_session<CR>", "Search sessions"},
  },
}, {prefix="<leader>"})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- directory stuff
WhichKey.register({
    [","] = {
        name = "filesystem and directory functions",
        a = {":set autochdir!", "toggle auto directory switching", noremap=true},
        p = {":pwd<CR>", "show current working directory", noremap=true},
        d = {":cd %:p:h<CR>:pwd<CR>", "change to directory of current file", noremap=true},
        e = {":cd %:p:h/..<CR>:pwd<CR>", "change to parent directory of current file", noremap=true},
        h = {":cd<CR>:pwd<CR>", "change to home directory", noremap=true},
        J = {":cd -<CR>:pwd<CR>", "change to previous directory", noremap=true},
    }
})

