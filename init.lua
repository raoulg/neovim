-- ==============================================================================================
-- Expanding Man's neovim config
--
-- see these guides on using lua with neovim:
--   - https://github.com/nanotee/nvim-lua-guide
--   - https://www.imaginaryrobots.net/2021/04/17/converting-vimrc-to-lua
--
-- see here for a great list of neovim plugins:
--   - https://github.com/rockerBOO/awesome-neovim#terminal-integration
-- ==============================================================================================

require("plugins")

pcall(require, "utils")
pcall(require, "general")

pcall(require, "appearance")

pcall(require, "etc/compe")
pcall(require, "etc/whichkey")
pcall(require, "etc/misckeybindings")
pcall(require, "etc/terminal")
pcall(require, "etc/galaxyline")
pcall(require, "etc/bufferline")
pcall(require, "etc/nvimtree")
pcall(require, "etc/julia")
pcall(require, "etc/latex")
pcall(require, "etc/telescope")
pcall(require, "etc/motions")
pcall(require, "etc/snippets")
pcall(require, "etc/registers")
pcall(require, "etc/todo")
pcall(require, "etc/dashboard")
pcall(require, "etc/markdown")
