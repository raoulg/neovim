# Portability System - Implementation Summary

## What Was Done

Your Neovim config now automatically adapts to different environments! It works seamlessly on:
- ✅ Your MacBook (full features: Copilot, ActivityWatch, CodeCompanion, etc.)
- ✅ Fresh Ubuntu VMs (minimal: core editing, LSP, git, fuzzy finding)
- ✅ Remote servers (no npm/node required)

## How It Works

### 1. Environment Detection (`lua/config/environment.lua`)

Automatically detects:
- **OS**: macOS, Linux, Windows
- **Hostname**: Your specific machine
- **Dependencies**: npm, node, python, ollama, etc.
- **Profile**: "full" or "minimal"

Your laptop (`MacBook-Pro-2.local`) = **full profile**
Everything else = **minimal profile**

### 2. Feature Flags

Plugins load conditionally based on these flags:

| Feature | Full | Minimal | Requires |
|---------|------|---------|----------|
| `copilot` | ✅ | ❌ | GitHub auth |
| `activity_watch` | ✅ | ❌ | External daemon |
| `codecompanion` | ✅ | ❌ | Ollama |
| `npm_lsp` | ✅ | ❌ | npm/node |
| `animations` | ✅ | ❌ | - |
| `git_blame` | ✅ | ❌ | - |
| `telekasten` | ✅ | ❌ | Laptop-specific paths |
| Core features | ✅ | ✅ | - |

### 3. Modified Files

**Created:**
- `lua/config/environment.lua` - Detection logic
- `SETUP_VM.md` - Quick guide for VMs
- `PORTABILITY_GUIDE.md` - This file

**Modified:**
- `init.lua` - Load environment first
- `lua/config/general.lua` - Added `:NvimEnv` command
- `lua/plugins/server.lua` - Conditional Copilot, ActivityWatch, CodeCompanion
- `lua/plugins/coding.lua` - Conditional Telekasten, git-blame
- `lua/plugins/themes.lua` - Conditional animations
- `lua/plugins/lsp.lua` - Dynamic LSP server list
- `AGENTS.md` - Document the system

## Usage

### On Your Laptop (Current Machine)

Nothing changes! All features work exactly as before.

Check it:
```vim
:NvimEnv
```
Shows: Profile = **full**, all features enabled

### On a Fresh VM

```bash
# Clone and start
git clone https://github.com/raoulg/neovim.git ~/.config/nvim
nvim

# Or use install script for Ubuntu
curl -sSL https://raw.githubusercontent.com/raoulg/neovim/main/install-nvim.sh | bash
```

The config will:
1. Detect it's not your laptop
2. Use minimal profile
3. Skip Copilot, ActivityWatch, CodeCompanion, npm-based LSP
4. Load core features only (Telescope, LSP, git, etc.)

Check it:
```vim
:NvimEnv
```
Shows: Profile = **minimal**, reduced features

### Adding Another "Full" Machine

Edit `lua/config/environment.lua` line ~14:

```lua
local FULL_HOSTS = {
    ["MacBook-Pro-2.local"] = true,
    ["work-laptop"] = true,  -- Add your work laptop
    ["desktop-pc"] = true,   -- Add your desktop
}
```

Or use OS-based detection:
```lua
M.is_full_machine = M.is_mac  -- All macOS = full
```

## What Works Where

### ✅ Works Everywhere (Minimal Profile)

**Core Editing:**
- Syntax highlighting (Treesitter)
- LSP: lua_ls (no npm needed)
- Completion (nvim-cmp with LSP)
- Snippets (LuaSnip)

**File Navigation:**
- Telescope fuzzy finder
- Neo-tree, Triptych file explorers
- Harpoon marks
- fzf-lua

**Git:**
- Gitsigns
- Lazygit integration

**Terminal:**
- Toggleterm
- REPL (yarepl) for Python/zsh

**UI:**
- All themes
- Lualine statusline
- Which-key
- Trouble diagnostics

**Sessions:**
- Persistence.nvim
- Mini.sessions

### ⚠️ Full Profile Only

**AI Tools:**
- GitHub Copilot (requires auth)
- CodeCompanion (requires Ollama)

**External Services:**
- ActivityWatch tracking

**npm-based LSP:**
- pyright (Python)
- html

**Nice-to-haves:**
- Mini.animate (animations)
- git-blame.nvim
- Telekasten notes

## Extending the System

### Add a New Conditional Plugin

In any `lua/plugins/*.lua` file:

```lua
local env = require("config.environment")

return {
    {
        "some/resource-heavy-plugin",
        cond = env.should_load("heavy_feature"),  -- Define in environment.lua
        config = function()
            -- ...
        end,
    },
}
```

### Add a New Feature Flag

In `lua/config/environment.lua`:

```lua
M.features = {
    -- Existing flags...
    my_new_feature = M.profile == "full",  -- Or any logic
}
```

### Check Dependencies in Plugins

```lua
local env = require("config.environment")

return {
    {
        "some/plugin-needing-rust",
        cond = env.has.cargo,  -- Only load if Cargo installed
    },
}
```

## Testing

### Test on Laptop
```bash
nvim
:NvimEnv  # Should show profile = full
:Lazy     # Green = loaded, Gray = disabled (none should be gray)
```

### Test Minimal Profile Locally

Temporarily change hostname check in `environment.lua`:
```lua
M.is_full_machine = false  -- Force minimal
```

Or test with different NVIM_APPNAME:
```bash
cp -r ~/.config/nvim ~/.config/nvim-minimal
# Edit the copy to force minimal
NVIM_APPNAME=nvim-minimal nvim
```

### Test on VM

```bash
# In VM
git clone https://github.com/raoulg/neovim.git ~/.config/nvim
nvim

# Inside nvim
:NvimEnv  # Should show profile = minimal
:Lazy     # Gray plugins = correctly disabled for minimal
```

## Troubleshooting

**Plugin not loading?**
```vim
:NvimEnv  # Check if feature is enabled
:Lazy     # Check plugin status (gray = disabled by cond)
```

**Want to force a feature on minimal?**
Edit `environment.lua`:
```lua
if M.hostname == "my-special-vm" then
    M.features.copilot = true  -- Override for this VM
end
```

**Dependency missing but feature enabled?**
The system auto-disables features if dependencies missing:
```lua
if not M.has.npm then
    M.features.npm_lsp = false  -- Auto-disabled
end
```

## Benefits

✅ **One config, everywhere** - No separate minimal/full configs
✅ **Zero manual setup on VMs** - Clone and go
✅ **Smart defaults** - Works without dependencies
✅ **Gradual enhancement** - Install deps to unlock features
✅ **Easy to extend** - Add machines to FULL_HOSTS
✅ **Self-documenting** - `:NvimEnv` shows current state

## Next Steps

1. **Test on a VM**: Clone config to Ubuntu VM and verify minimal profile
2. **Add your machines**: Update `FULL_HOSTS` with other laptops
3. **Customize features**: Adjust feature flags for your workflow
4. **Update install script**: Consider adding environment hints to `install-nvim.sh`

## Quick Reference

| Command | Purpose |
|---------|---------|
| `:NvimEnv` | Show profile and features |
| `:Lazy` | See plugin status (gray = disabled) |
| `:checkhealth` | Diagnose issues |
| `:Mason` | Manage LSP servers |

**Files to know:**
- `lua/config/environment.lua` - Add machines, modify features
- `SETUP_VM.md` - Share with others for VM setup
- `AGENTS.md` - Full documentation for agents/contributors
