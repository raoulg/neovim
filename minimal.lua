
function set_packpath()
    dir = os.getenv("HOME")..".local/share/nvim/site/pack/packer"
    vim.cmd("set packpath="..dir)
end
set_packpath()


--TODO: want to be able to add packages this way but it currently doesn't work because of default
--directory structure
--vim.cmd("packadd nvim-cmp")

Cmp = require("cmp")
