-- ==============================================================================================
-- Expanding Man's neovim config
-- ==============================================================================================

require("plugins")

require("utils")
require("general")

pcall(require, "appearance")

pcall(require, "etc/completion")
pcall(require, "etc/whichkey")
pcall(require, "etc/misckeybindings")
pcall(require, "etc/terminal")
pcall(require, "etc/galaxyline")
pcall(require, "etc/bufferline")
pcall(require, "etc/nvimtree")
pcall(require, "etc/julia")
pcall(require, "etc/latex")
pcall(require, "etc/telescope")
pcall(require, "etc/spectre")
pcall(require, "etc/motions")
pcall(require, "etc/snippets")
pcall(require, "etc/registers")
pcall(require, "etc/todo")
pcall(require, "etc/trouble")
pcall(require, "etc/sessions")
pcall(require, "etc/markdown")
pcall(require, "etc/json")
pcall(require, "etc/lsp")
