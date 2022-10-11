local TSConfig = require("nvim-treesitter.configs")
local TSParsers = require("nvim-treesitter.parsers")

-- TODO: until this PR is merged
-- https://github.com/tree-sitter/tree-sitter-julia/pull/54
-- this is for a custom parser
local parser_config = TSParsers.get_parser_configs()
parser_config.julia = {
    install_info = {
        url = "https://github.com/savq/tree-sitter-julia",
        files = {"src/parser.c"},
        branch = "dev", 
    },
    filetype = "jl",
}


TSConfig.setup {
    ensure_installed = {"c", "lua", "rust", "zig", "fish"},
    auto_install = true,
    highlight = {
        -- vimtex doesn't like treesitter doing the highlighting
        -- the markdown and julia TS grammars both suck
        -- TODO: sadly, the Julia ts is still a bit wonky
        disable = {"latex", "markdown", "julia"},
        enable = true,
    },
    additional_vim_regex_highlighting = true,
}
