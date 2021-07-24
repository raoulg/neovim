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
require("utils")
require("general")

require("appearance")

require("etc/compe")
require("etc/whichkey")
require("etc/misckeybindings")
require("etc/terminal")
require("etc/galaxyline")
require("etc/bufferline")
require("etc/nvimtree")
require("etc/julia")
require("etc/latex")
require("etc/telescope")
require("etc/motions")
require("etc/snippets")
require("etc/registers")
require("etc/todo")
require("etc/dashboard")
