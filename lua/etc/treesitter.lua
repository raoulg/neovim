local TSConfig = require("nvim-treesitter.configs")

TSConfig.setup {
    ensure_installed = {"c", "lua", "rust", "zig"},
    auto_install = true,
    highlight = {
        -- vimtex doesn't like treesitter doing the highlighting
        -- the markdown and julia TS grammars both suck
        disable = {"latex", "markdown", "julia"},
        enable = true,
    },
    additional_vim_regex_highlighting = true,
}
