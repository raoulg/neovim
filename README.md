# neovim/

<a href="https://dotfyle.com/raoulg/neovim"><img src="https://dotfyle.com/raoulg/neovim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/raoulg/neovim"><img src="https://dotfyle.com/raoulg/neovim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/raoulg/neovim"><img src="https://dotfyle.com/raoulg/neovim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:raoulg/neovim ~/.config/raoulg/neovim
git clone https://github.com/raoulg/neovim.git ~/.config/raoulg/nvim
```

To test this config:

```sh
NVIM_APPNAME=raoulg/nvim/ nvim
```

or (optionally) back up existing config with
```mv ~/.config/nvim ~/.config/nvim.bak``` 
and then install it with 
```sh
git clone https://github.com/raoulg/neovim.git ~/.config/nvim
```
For ubuntu, it is possible to use the install script:
```sh
curl -sSL https://raw.githubusercontent.com/raoulg/neovim/main/install-nvim.sh | bash
```

## Plugins

### ai

+ [olimorris/codecompanion.nvim](https://dotfyle.com/plugins/olimorris/codecompanion.nvim)
### bars-and-lines

+ [Bekaboo/dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim)
### code-runner

+ [milanglacier/yarepl.nvim](https://dotfyle.com/plugins/milanglacier/yarepl.nvim)
### color

+ [ziontee113/color-picker.nvim](https://dotfyle.com/plugins/ziontee113/color-picker.nvim)
+ [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
### colorschemes

+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [marko-cerovac/material.nvim](https://dotfyle.com/plugins/marko-cerovac/material.nvim)
+ [navarasu/onedark.nvim](https://dotfyle.com/plugins/navarasu/onedark.nvim)
+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [gbprod/nord.nvim](https://dotfyle.com/plugins/gbprod/nord.nvim)
+ [Abstract-IDE/Abstract-cs](https://dotfyle.com/plugins/Abstract-IDE/Abstract-cs)
### comment

+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
+ [LudoPinelli/comment-box.nvim](https://dotfyle.com/plugins/LudoPinelli/comment-box.nvim)
+ [danymat/neogen](https://dotfyle.com/plugins/danymat/neogen)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
+ [iguanacucumber/magazine.nvim](https://dotfyle.com/plugins/iguanacucumber/magazine.nvim)
+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
### debugging

+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
### file-explorer

+ [simonmclean/triptych.nvim](https://dotfyle.com/plugins/simonmclean/triptych.nvim)
+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
+ [danielfalk/smart-open.nvim](https://dotfyle.com/plugins/danielfalk/smart-open.nvim)
+ [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)
+ [tsakirist/telescope-lazy.nvim](https://dotfyle.com/plugins/tsakirist/telescope-lazy.nvim)
### git

+ [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### indent

+ [nvimdev/indentmini.nvim](https://dotfyle.com/plugins/nvimdev/indentmini.nvim)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [stevearc/aerial.nvim](https://dotfyle.com/plugins/stevearc/aerial.nvim)
+ [VonHeikemen/lsp-zero.nvim](https://dotfyle.com/plugins/VonHeikemen/lsp-zero.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### lua-colorscheme

+ [ellisonleao/gruvbox.nvim](https://dotfyle.com/plugins/ellisonleao/gruvbox.nvim)
### markdown-and-latex

+ [MeanderingProgrammer/render-markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/render-markdown.nvim)
+ [micangl/cmp-vimtex](https://dotfyle.com/plugins/micangl/cmp-vimtex)
### marks

+ [chentoast/marks.nvim](https://dotfyle.com/plugins/chentoast/marks.nvim)
+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)
### media

+ [3rd/image.nvim](https://dotfyle.com/plugins/3rd/image.nvim)
+ [adelarsq/image_preview.nvim](https://dotfyle.com/plugins/adelarsq/image_preview.nvim)
### motion

+ [ggandor/leap.nvim](https://dotfyle.com/plugins/ggandor/leap.nvim)
### note-taking

+ [nvim-orgmode/orgmode](https://dotfyle.com/plugins/nvim-orgmode/orgmode)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [kkharji/sqlite.lua](https://dotfyle.com/plugins/kkharji/sqlite.lua)
### plugin-manager

+ [wbthomason/packer.nvim](https://dotfyle.com/plugins/wbthomason/packer.nvim)
+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### project

+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### quickfix

+ [stevearc/quicker.nvim](https://dotfyle.com/plugins/stevearc/quicker.nvim)
### session

+ [echasnovski/mini.sessions](https://dotfyle.com/plugins/echasnovski/mini.sessions)
+ [folke/persistence.nvim](https://dotfyle.com/plugins/folke/persistence.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### split-and-window

+ [mrjones2014/smart-splits.nvim](https://dotfyle.com/plugins/mrjones2014/smart-splits.nvim)
### startup

+ [echasnovski/mini.starter](https://dotfyle.com/plugins/echasnovski/mini.starter)
+ [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [desdic/agrolens.nvim](https://dotfyle.com/plugins/desdic/agrolens.nvim)
### tabline

+ [romgrk/barbar.nvim](https://dotfyle.com/plugins/romgrk/barbar.nvim)
### terminal-integration

+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
### utility

+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [echasnovski/mini.animate](https://dotfyle.com/plugins/echasnovski/mini.animate)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [GCBallesteros/jupytext.nvim](https://dotfyle.com/plugins/GCBallesteros/jupytext.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
### web-development

+ [roobert/tailwindcss-colorizer-cmp.nvim](https://dotfyle.com/plugins/roobert/tailwindcss-colorizer-cmp.nvim)
## Language Servers

+ html
+ lua_ls
+ pyright


 This readme was generated by [Dotfyle](https://dotfyle.com)
