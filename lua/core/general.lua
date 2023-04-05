
COLORS = {
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

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- settings for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true


-- Make line numbers default
vim.wo.number = true
vim.o.rnu = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd[[colorscheme gruvbox]]

vim.g.startify_custom_header = {
        [[                                  __                ]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        [[                                                    ]],
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


WhichKey = require("which-key")

WhichKey.register({
  ["]q"] = {"<cmd>cnext<CR>", "Next quicklist item"},
  ["[q"] = {"<cmd>cprev<CR>", "Previous quicklist item"},
})


WhichKey.register({
  n = {"<cmd>Neotree<CR>", "Neotree"},
  t = {name = "toggle",
    b = {"<cmd>let &background = ( &background == 'dark' ? 'light' : 'dark' )<CR>", "toggle background"},
    r = {"<cmd>setl rnu!<CR>", "relative line numbers"},
    n = {"<cmd>setl nu!<CR>", "line numbers"},
  },
}, {prefix="<leader>"})

