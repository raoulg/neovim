# Quick Setup for VMs and Remote Machines

This Neovim config automatically detects your environment and adjusts features accordingly.

## TL;DR - One Command Install

```bash
# Ubuntu/Debian
curl -sSL https://raw.githubusercontent.com/raoulg/neovim/main/install-nvim.sh | bash

# Or manual install
git clone https://github.com/raoulg/neovim.git ~/.config/nvim
nvim  # Will auto-install plugins on first launch
```

**That's it!** The config will:
- Auto-detect it's not on your laptop
- Use **minimal profile** (no Copilot, ActivityWatch, etc.)
- Only install LSP servers that don't need npm
- Skip heavy animations and image preview

## What Works in Minimal Mode

### ✅ Always Available

- **LSP**: `lua_ls` (no npm needed)
- **File navigation**: Telescope, fzf, Harpoon, Neo-tree, Triptych
- **Basic completion**: nvim-cmp with LSP
- **Git**: gitsigns, lazygit
- **Terminal**: toggleterm, yarepl (Python REPL)
- **Themes**: All colorschemes
- **Sessions**: persistence.nvim, mini.sessions
- **Utilities**: which-key, trouble.nvim
- **Core editing**: Treesitter, leap.nvim, comment-box

### ❌ Disabled in Minimal Mode

- **Copilot** (requires GitHub auth)
- **ActivityWatch** (requires external daemon)
- **CodeCompanion** (requires Ollama)
- **Telekasten** (laptop-specific notes path)
- **git-blame** (can be resource intensive)
- **Animations** (mini.animate)
- **npm-based LSP servers** (pyright, html, etc.)

## Checking Your Profile

Inside Neovim:
```vim
:NvimEnv
```

Shows:
- Current profile (full/minimal)
- Enabled/disabled features
- Available dependencies

## Installing Optional Dependencies

If you want more features on a VM:

### Python LSP (requires npm/node)
```bash
# Install Node.js first
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Restart nvim - will auto-install pyright via Mason
```

### Better file searching
```bash
sudo apt install ripgrep fd-find
```

### Yazi file manager
```bash
# See: https://github.com/sxyazi/yazi
cargo install --locked yazi-fm yazi-cli
```

## Force Full Profile on Any Machine

Edit `/Users/rgrouls/.config/nvim/lua/config/environment.lua`:

```lua
-- Option 1: Add your VM hostname
local FULL_HOSTS = {
    ["MacBook-Pro-2.local"] = true,
    ["my-ubuntu-vm"] = true,  -- Add your VM name
}

-- Option 2: Force all Linux machines to use full profile
M.is_full_machine = M.is_mac or M.is_linux
```

Then restart nvim.

## Adding Your Own VM

If you want specific features on a particular VM:

```lua
-- In lua/config/environment.lua
if M.hostname == "my-dev-server" then
    M.features.copilot = false  -- No Copilot
    M.features.npm_lsp = true   -- But enable npm LSP if available
end
```

## Troubleshooting

**No syntax highlighting?**
- Treesitter needs `gcc` or `clang`: `sudo apt install build-essential`

**LSP not working?**
- Run `:Mason` to check installed servers
- Run `:LspInfo` to see attachment status
- Run `:checkhealth` for diagnostics

**Plugins not loading?**
- Delete `~/.local/share/nvim` and restart (fresh plugin install)
- Run `:Lazy sync`

**Want to see what's loaded?**
- `:Lazy` - Shows all plugins and their status
- Green = loaded, gray = not loaded (disabled for minimal)
