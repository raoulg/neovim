# Expanding Man's Neovim Config
This is a lua-based neovim configuration with a number of customized plugin configurations.

Particular emphasis is placed on [Julia](https://julialang.org/) in which I spend most of my time,
and LaTeX, but the configuration should also work well for rust, zig, crystal and Python.

## Resources
- [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) is an extensive list of lua-focused
    neovim plugins.  Most of the plugins I'm using were discovered there.
- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide) is a useful resource for using neovim
    with lua.
- [converting-vimrc-to-lua](https://www.imaginaryrobots.net/2021/04/17/converting-vimrc-to-lua) is a
    useful blog post about converting an `init.vim` to an `init.lua`.

## Installation
This repo can be cloned directly to `~/.config/neovim`.  After cloning, the nvim plugin manager
packer should be able to handle the rest with a call to `PackerInstall` from inside vim.  See
[Expanding Man's dotfiles repo](https://gitlab.com/ExpandingMan/dotfiles) for my installation
process which is handled with my [Installer.jl](https://gitlab.com/ExpandingMan/Installer.jl)
package.

## Organization
- `init.lua` only includes `require` statements that run code found in the `lua` directory.
- `lua/plugins.lua` contains [packer](https://github.com/wbthomason/packer.nvim) plugin
    inclusion.
- `lua/utils.lua` contains my own lua utilities.
- `lua/general.lua` contains the most basic and general vim settings.
- `lua/etc` contains various settings, mostly for specific plugins.
