require("packages")
require("general")
require("julia")
pcall(require, "etc/telescope")
pcall(require, "etc/lualine")
pcall(require, "etc/git")
pcall(require, "etc/terminal")
pcall(require, "etc/aerial")
pcall(require, "etc/complete")
pcall(require, "etc/sessions")
pcall(require, "etc/leap")
pcall(require, "etc/wilder")
pcall(require, "etc/windows")
pcall(require, "etc/treesitter")
pcall(require, "etc/debugger")
pcall(require, "etc/bufferline")

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

require("lsp")

-- Turn on lsp status information
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
