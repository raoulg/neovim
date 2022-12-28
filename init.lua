require("packages")
require("general")
require("julia")
pcall(require, "etc/telescope")
pcall(require, "etc/diagnostics")
pcall(require, "etc/lualine")
pcall(require, "etc/gitsigns")
pcall(require, "etc/terminal")
pcall(require, "etc/aerial")
pcall(require, "etc/complete")
pcall(require, "etc/sessions")
pcall(require, "etc/leap")
pcall(require, "etc/wilder")
pcall(require, "etc/treesitter")


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


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
