local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
end

-- auto compile when there are changes in `plugins.lua`
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

Packer = require("packer")

Packer.startup(function()
    use "wbthomason/packer.nvim"

    -- lua utilities
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"  -- required by (at least) telescope.nvim
    use "rafcamlet/nvim-luapad"

    -- colors and appearance
    use "ryanoasis/vim-devicons"
    use "kyazdani42/nvim-web-devicons"

    -- languages and file types
    use "JuliaEditorSupport/julia-vim"
    use "rust-lang/rust.vim"
    use "lervag/vimtex"
    use "cespare/vim-toml"
    use "plasticboy/vim-markdown"
    use "ziglang/zig.vim"
    use "vim-crystal/vim-crystal"
    use "gennaro-tedesco/nvim-jqx"
    use "godlygeek/tabular"
    use "chrisbra/csv.vim"
    use "khaveesh/vim-fish-syntax"

    -- statusline
    use "glepnir/galaxyline.nvim"

    -- buffer bar
    use "akinsho/nvim-bufferline.lua"

    -- file explorer
    use "kyazdani42/nvim-tree.lua"

    -- completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip"
    use "https://gitlab.com/ExpandingMan/cmp-latex"
    use "racer-rust/vim-racer"

    -- which key
    use "folke/which-key.nvim"

    -- terminal
    use "akinsho/nvim-toggleterm.lua"
    use "hkupty/iron.nvim"

    -- search
    use "nvim-telescope/telescope.nvim"
    use "windwp/nvim-spectre"

    -- motions
    use "ggandor/lightspeed.nvim"

    -- snippets
    use "L3MON4D3/LuaSnip"

    -- registers
    use "tversteeg/registers.nvim"

    -- todo comments
    use "folke/todo-comments.nvim"
    use "folke/trouble.nvim"

    -- sessions
    use "rmagatti/auto-session"
    use "rmagatti/session-lens"

    -- org mode
    -- NOTE: haven't explored this yet, wanted reminder
    --use "nvim-treesitter/nvim-treesitter"
    --use "kristijanhusak/orgmode.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "glepnir/lspsaga.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    --use {"~/src/JET.nvim", ft={"julia"}}

end)
