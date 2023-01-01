require("core.pluginconfig.aerial")
require("core.pluginconfig.bufferline")
require("core.pluginconfig.complete")
require("core.pluginconfig.debugger")
require("core.pluginconfig.focus")
require("core.pluginconfig.git")
require("core.pluginconfig.julia")
require("core.pluginconfig.leap")
require("core.pluginconfig.lsp")
require("core.pluginconfig.lualine")
require("core.pluginconfig.neotree")
require("core.pluginconfig.sessions")
require("core.pluginconfig.telescope")
require("core.pluginconfig.terminal")
require("core.pluginconfig.treesitter")
require("core.pluginconfig.wilder")
require("core.pluginconfig.windows")

-- require('feline').setup()
require('project_nvim').setup()
require('Comment').setup()
require("trouble").setup()

-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
require('fidget').setup()
require("todo-comments").setup()

-- https://github.com/folke/noice.nvim
-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
-- https://github.com/chipsenkbeil/distant.nvim
-- A wrapper around distant that enables users to edit remote files from the comfort of their local environment.
-- https://github.com/rockerBOO/awesome-neovim
-- https://github.com/renerocksai/telekasten.nvim
-- A Neovim (lua) plugin for working with a text-based, markdown zettelkasten / wiki and mixing it with a journal, based on telescope.nvim.

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
