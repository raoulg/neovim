# AGENTS.md - Neovim Configuration Repository

## Project Overview

This is a personal Neovim configuration repository using **lazy.nvim** plugin manager. The configuration is designed for Python development, note-taking (Telekasten/Orgmode), and general coding with comprehensive LSP, completion, and AI assistance features.

**Repository**: https://github.com/raoulg/neovim  
**Neovim requirement**: 0.9+  
**Platform**: macOS (primary), Linux (Ubuntu supported via install script)  
**Shell**: zsh (default for terminals)

## Directory Structure

```
/Users/rgrouls/.config/nvim/
├── init.lua                    # Entry point - loads config modules
├── lua/
│   ├── config/
│   │   ├── general.lua         # Global vim settings, autocmds, leader key
│   │   ├── keymaps.lua         # All keybindings using which-key
│   │   └── lazy.lua            # Lazy.nvim bootstrap and setup
│   ├── plugins/                # Plugin specs for lazy.nvim
│   │   ├── coding.lua          # Telekasten, git-blame, neoclip, sessions
│   │   ├── debug.lua           # DAP config (currently commented out)
│   │   ├── finding.lua         # Telescope, fzf, file explorers, harpoon
│   │   ├── lsp.lua             # LSP configuration, mason, lspconfig
│   │   ├── server.lua          # Copilot, CodeCompanion (AI), Yazi
│   │   ├── sessions.lua        # Session management
│   │   ├── terminal.lua        # REPL (yarepl), toggleterm
│   │   └── themes.lua          # UI plugins, colorschemes, statusline
│   ├── current-theme.lua       # Generated theme file (gitignored)
│   └── bak/                    # Backup/old packer configs (ignore)
├── spell/                      # Custom spell files
├── lazy-lock.json              # Lazy.nvim plugin lockfile
├── install-nvim.sh             # Ubuntu installation script
├── minimal_init.lua            # Minimal test configuration
└── .gitignore                  # Git ignore rules
```

## Essential Commands

### Installing / Updating

**Install from scratch**:
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone repository
git clone https://github.com/raoulg/neovim.git ~/.config/nvim

# Launch nvim - lazy.nvim will auto-install and sync plugins on first run
nvim
```

**Test without installing** (isolated environment):
```bash
git clone https://github.com/raoulg/neovim.git ~/.config/raoulg/nvim
NVIM_APPNAME=raoulg/nvim/ nvim
```

**Ubuntu installation** (includes Neovim binary):
```bash
curl -sSL https://raw.githubusercontent.com/raoulg/neovim/main/install-nvim.sh | bash
```
Note: Script downloads latest Neovim from GitHub releases, installs to `/opt/nvim-linux-x86_64/bin/`, and clones config.

### Plugin Management

All plugin management is done through **lazy.nvim**:

- **Update plugins**: `<leader>Lu` or `:Lazy` then `U`
- **Sync plugins**: `:Lazy sync` (install missing, clean removed, update)
- **Check startup performance**: `<leader>Lp` or `:Lazy profile`
- **Install new plugin**: Add spec to `lua/plugins/*.lua`, restart nvim (auto-updates on VimEnter)

### Updating This Configuration

All changes should be pushed to the repository. On another machine:
```bash
cd ~/.config/nvim
git pull
# Restart nvim - lazy.nvim auto-updates on VimEnter
```

**Note**: `lazy-lock.json` tracks exact plugin versions. Commit after major updates.

## Configuration Principles

### Leader Keys

- **Leader**: `<Space>` (space bar)
- **Local leader**: Not set (default `\` disabled)

### Loading Strategy

1. `init.lua` loads three core modules:
   - `config.general` → Global settings, options, autocmds
   - `config.lazy` → Plugin manager bootstrap
   - `config.keymaps` → All keybindings

2. `config.lazy` imports all plugins from `lua/plugins/*.lua`

3. Plugins use lazy-loading strategies:
   - `event = "VeryLazy"` → After UI loads
   - `event = "InsertEnter"` → First time entering insert mode
   - `event = "BufReadPre"` → Before reading buffer
   - `lazy = true, keys = {...}` → Load on keypress
   - `lazy = true, cmd = "..."` → Load on command

### Code Style

**Lua formatting**:
- Tabs: **4 spaces** (hard rule, enforced in general.lua)
- Indent style: Standard Lua conventions
- String quotes: Double quotes preferred
- Function definitions: Standard Lua formatting

**Plugin specs**:
- Each plugin in `lua/plugins/*.lua` returns a table of plugin specs
- Format:
  ```lua
  return {
      {
          "owner/plugin-name",
          lazy = true,            -- Load strategy
          event = "VeryLazy",     -- When to load
          dependencies = {...},   -- Plugin dependencies
          keys = {...},           -- Key mappings
          opts = {},              -- Auto-calls setup(opts)
          config = function()     -- Custom setup
              require("plugin").setup({...})
          end,
      },
  }
  ```

## Critical Settings

### General Options (config/general.lua)

```lua
vim.g.mapleader = " "                  -- Space as leader
vim.opt.colorcolumn = "88"             -- Python PEP 8 line length guide
vim.opt.tabstop = 4                    -- 4 space tabs
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.wo.number = true                   -- Line numbers
vim.o.rnu = true                       -- Relative line numbers
vim.o.hlsearch = false                 -- No search highlighting
vim.o.ignorecase = false               -- Case sensitive search
vim.o.smartcase = true                 -- Unless uppercase in search
vim.o.undofile = true                  -- Persistent undo
vim.g.loaded_netrw = 1                 -- Disable netrw (using Yazi/Triptych)
```

**Auto-open directory handler**:
- When opening a directory, Neovim auto-opens `Yazi` (file manager)
- Autocmd in `general.lua:86-97`

### Color Configuration

Color palette defined in `general.lua:1-20` (Dracula-inspired):
```lua
COLORS = {
    background = "#282a36",
    foreground = "#f8f8f2",
    comment = "#6272a4",
    cyan = "#8be9fd",
    green = "#50fa7b",
    orange = "#ffb86c",
    -- ... etc
}
```

### Current Theme Management

Theme is saved to `lua/current-theme.lua` (gitignored). Theme switcher plugins write to this file, and it's loaded in `config/lazy.lua:39-42`.

## Language Servers & Development

### LSP Setup (plugins/lsp.lua)

**Installed via Mason**:
- `pyright` - Python LSP (custom virtual environment detection)
- `lua_ls` - Lua LSP
- `html` - HTML LSP

**LSP Key Bindings** (auto-applied on LSP attach):
- `K` - Hover documentation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `go` - Go to type definition
- `gr` - Find references
- `gs` - Signature help
- `<F2>` - Rename
- `<F3>` - Format
- `<F4>` - Code action

**Mason package manager**:
- `:Mason` - Open Mason UI to install LSP servers, formatters, linters
- Servers auto-installed via `ensure_installed` list in `lsp.lua:72-76` (currently empty)

### Python-Specific Configuration

**Virtual Environment Detection** (lsp.lua:87-99):
- Pyright auto-detects `.venv` in project root
- Sets `pythonPath` to `.venv/bin/python`
- Shows notification on LSP attach

**Python REPL** (terminal.lua via yarepl):
- Multiple REPL options: `python`, `ipython`, `bpython`
- Send code to REPL with `<leader>sl` (line) or visual selection
- Start REPL: `<leader>ss`

### Completion & Snippets

**Completion sources** (seen in plugins, full config likely in coding.lua):
- `nvim-cmp` - Completion engine
- `cmp-nvim-lsp` - LSP completions
- `copilot-cmp` - GitHub Copilot
- `cmp-vimtex` - LaTeX completions
- `LuaSnip` - Snippet engine

### Formatting

**Conform.nvim** (seen in README) - Auto-formatting
- Likely configured for Python (black/ruff), Lua (stylua)
- Format on save or via `<F3>`

### AI Assistance

**GitHub Copilot** (server.lua:6-23):
- Enabled by default (not lazy-loaded)
- Suggestions and panel enabled
- Integrated with nvim-cmp

**CodeCompanion** (server.lua:25-70):
- LLM chat interface for code assistance
- Uses **Ollama** adapter by default
- Model: `eramax/nxcode-cq-7b-orpo:q6`
- Key bindings:
  - `<leader>ca` - Show actions
  - `<leader>cc` - Toggle chat
  - `<leader>ci` - Inline chat

### Debugging

**nvim-dap** (debug.lua):
- **Currently disabled** (all lines commented out)
- Configured for Python debugging with debugpy
- Keybindings: `<leader>db` (breakpoint), `<leader>dc` (continue), etc.
- To enable: Uncomment debug.lua plugin specs

## Key Binding Groups

All keymaps use **which-key** for discoverability. Press `<leader>` and wait to see menu.

### Core Bindings

- `,,` - Save current buffer
- `jj` (terminal mode) - Exit insert mode
- `gx` - Open file/URL under cursor

### Leader Key Groups

**Buffer & Tab Management** (`;` prefix):
- `;o` - Order buffers (barbar.nvim)

**Code** (`<leader>c`):
- `<leader>ca` - AI code actions (CodeCompanion)
- `<leader>cc` - AI chat toggle
- `<leader>cd` - AI add to context
- `<leader>ci` - AI inline chat
- `<leader>cs` - Lspsaga finder
- `<leader>cp` - Peek definition
- `<leader>cw` - Open Yazi in working directory

**Debug** (`<leader>d`):
- Currently all disabled (see debug.lua)

**Find/Search** (`<leader>f`):
- `<leader>fF` - Smart open (frequency-based)
- `<leader>fP` - Find in present working directory
- `<leader>fh` - Find harpoon marks
- `<leader>f0` - Open starter screen
- `<leader>fl*` - LSP finders (symbols, references, etc.)
- `<leader>fx*` - Treesitter object finders

**Git** (`<leader>G`):
- Plugins: git-blame.nvim, gitsigns.nvim, lazygit.nvim

**Harpoon Marks** (`<leader>m`):
- `<leader>ma` - Add to list
- `<leader>mt` - Toggle quick menu
- `<leader>ms/d/j/k` - Jump to mark 1/2/3/4
- `<leader>mp/mn` - Previous/next mark
- `<leader>fh` - Find in Telescope

**Lazy Plugin Manager** (`<leader>L`):
- `<leader>Lu` - Update via Lazy
- `<leader>Lp` - Show startup profile

**LaTeX** (`<leader>l`):
- vimtex integration (details in plugins)

**Sessions** (`<leader>S`):
- `<leader>SS` - Load session (persistence.nvim)
- `<leader>Ss` - Select session

**Send to REPL** (`<leader>s`):
- `<leader>ss` - Start REPL
- `<leader>st` - Toggle REPL
- `<leader>sl` - Send line/selection
- `<leader>sb` - Attach buffer

**Terminal** (`<leader>t`):
- `<leader>tt` - Vertical terminal (toggleterm)
- `<leader>tf` - Float terminal
- `<leader>th` - Horizontal terminal
- `<leader>tz` - Open zsh in vertical split
- `<C-\>` - Quick toggle terminal

**Toggle Settings** (`<leader>T`):
- `<leader>Tb` - Toggle light/dark background
- `<leader>Tn` - Toggle line numbers
- `<leader>Tr` - Toggle relative numbers

**Windows** (`<leader>w`):
- `<leader>ww` - Other window
- `<leader>w-` - Split horizontal
- `<leader>w|` - Split vertical
- `<leader>wh/j/k/l` - Navigate windows
- `<leader>w=` - Balance windows

**Trouble** (`<leader>x`):
- Diagnostics panel (folke/trouble.nvim)

**Yank** (`<leader>y`):
- `<leader>yy` - Yank to system clipboard (visual)
- `<leader>yf` - Yank filename
- `<leader>yp` - Yank full path
- `<leader>yh` - Yank history (neoclip)
- `<leader>ym` - Macro history

**Orgmode** (`<leader>O`):
- Note-taking with nvim-orgmode

### Directory Navigation (`,` prefix)

- `,a` - Toggle autochdir
- `,p` - Print working directory
- `,d` - Change to file's directory
- `,e` - Change to parent directory
- `,h` - Change to home
- `,J` - Jump to previous directory

### QuickFix List

- `]q` / `[q` - Next/previous quickfix item
- `]Q` / `[Q` - Last/first quickfix item
- `]C` - Close quickfix

### File Explorers

- `<leader>n` or `<C-n>` - Neo-tree
- `<leader>-` or `<C-e>` - Triptych
- `<leader>e` - Yazi (at current file)

## Important Gotchas & Notes

### Plugin Loading

1. **Lazy.nvim auto-updates on startup**: VimEnter autocmd in lazy.lua:17-21 runs `:Lazy update` silently
   - This keeps plugins current but can cause unexpected changes
   - Check `lazy-lock.json` diffs to see what updated

2. **Theme persistence**: Current theme stored in `lua/current-theme.lua` (gitignored)
   - Don't commit this file
   - Theme changes won't persist across machines without manually selecting

3. **Copilot always loaded**: Not lazy-loaded (`lazy = false` in server.lua:7)
   - Increases startup time slightly
   - Remove `lazy = false` if you want on-demand loading

### File Management

4. **Netrw disabled**: `vim.g.loaded_netrw = 1` in general.lua
   - Directory opens trigger Yazi instead
   - Use Yazi, Triptych, or Neo-tree for file browsing

5. **Spell files**: Dutch spell file in `spell/nl.utf-8.add`
   - Neovim auto-compiles to `.spl` file
   - Add custom words with `zg` in normal mode

### Python Development

6. **Virtual environment path**: Pyright expects `.venv` in project root
   - Uses `.venv/bin/python` automatically
   - Change in lsp.lua:93 if using different venv name

7. **DAP debugging disabled**: All debug config commented out
   - To enable: Uncomment debug.lua plugin specs
   - Requires `debugpy` installed via Mason

### REPL Behavior

8. **REPL default window**: Vertical split, 50 columns (terminal.lua:14)
   - Change `wincmd` in yarepl setup for different layout
   - Available REPLs: python, ipython, bpython, zsh, julia, aichat

9. **Terminal insert mode**: Press `jj` or `<C-n>` to exit (keymaps.lua:126-127)
   - Standard `<Esc>` doesn't work in terminal mode

### Session Management

10. **Duplicate persistence.nvim**: Plugin defined twice (coding.lua:51-71 and 78-82)
    - Likely a copy-paste error
    - Remove duplicate at lines 78-82

### Performance

11. **Heavy plugin load**: 50+ plugins configured
    - Most are lazy-loaded
    - Use `<leader>Lp` to profile startup time
    - Consider disabling unused plugins for faster startup

12. **Image preview plugins**: `3rd/image.nvim` and `adelarsq/image_preview.nvim`
    - Require external dependencies (ImageMagick, etc.)
    - May not work in all terminals

### AI Models

13. **CodeCompanion uses local Ollama**:
    - Model: `eramax/nxcode-cq-7b-orpo:q6`
    - Requires Ollama running locally
    - Change adapter in server.lua:46-68 for cloud LLMs (Anthropic, OpenAI)

14. **Copilot authentication**: Requires GitHub account and auth
    - Run `:Copilot auth` on first use
    - Check `:Copilot status` if not working

### Git Ignore

15. **Ignored files** (.gitignore):
    - `/plugin` - Auto-generated Lazy.nvim file
    - `**/bak/` - Old Packer configs
    - `Session.vim` - Session files
    - `lua/current-theme.lua` - Theme persistence
    - `.aider*` - Aider AI coding assistant files

## Testing & Troubleshooting

### Testing Changes

**Minimal config** (`minimal_init.lua`):
```bash
nvim -u ~/.config/nvim/minimal_init.lua
```
Use this to test if issues are plugin-related.

**Check LSP status**:
```vim
:LspInfo        " See attached LSP servers
:Mason          " Check installed packages
:checkhealth    " Comprehensive health check
```

**Check plugin load times**:
```vim
:Lazy profile
```

**View plugin specs**:
```vim
:Lazy          " Shows all plugins, status, load time
```

### Common Issues

**LSP not attaching**:
1. Check `ensure_installed` in lsp.lua is empty (manual installation)
2. Run `:Mason` and install server manually
3. Check `:LspInfo` for errors
4. Ensure file type is recognized (`:set filetype?`)

**Copilot not working**:
1. Run `:Copilot status`
2. Authenticate with `:Copilot auth`
3. Check Node.js installed (`node --version`)

**Telescope/fzf errors**:
1. Check `rg` (ripgrep) installed: `rg --version`
2. Install: `brew install ripgrep` (macOS) or `apt install ripgrep` (Ubuntu)

**Terminal mode stuck**:
1. Press `jj` or `<C-n>` (custom mappings)
2. If that fails: `<C-\><C-n>` (Neovim default)

**Theme not loading**:
1. Check `lua/current-theme.lua` exists and is valid Lua
2. Manually set: `:colorscheme tokyonight` (or another from themes.lua)
3. Theme plugins are lazy-loaded - may need to trigger

**Slow startup**:
1. Run `:Lazy profile` to find culprits
2. Ensure plugins have proper lazy-loading (`event`, `keys`, `cmd`)
3. Disable `VimEnter` auto-update in lazy.lua:17-21 for faster startup

## Modifying This Configuration

### Adding a New Plugin

1. Choose appropriate file in `lua/plugins/`:
   - `coding.lua` - General coding tools, sessions, notes
   - `finding.lua` - Finders, file explorers, navigation
   - `lsp.lua` - LSP, completion, formatting
   - `server.lua` - AI tools, file managers
   - `terminal.lua` - Terminal and REPL plugins
   - `themes.lua` - UI, colorschemes, statusline

2. Add plugin spec:
   ```lua
   {
       "owner/plugin-name",
       lazy = true,
       event = "VeryLazy",  -- or keys, cmd, etc.
       opts = {},           -- calls setup() automatically
       -- OR
       config = function()
           require("plugin").setup({...})
       end,
   }
   ```

3. Add keybindings to `config/keymaps.lua` using which-key:
   ```lua
   wk.add({
       { "<leader>xy", "<cmd>PluginCommand<CR>", desc = "Plugin action" },
   })
   ```

4. Restart Neovim - Lazy will auto-install

5. **Commit changes**:
   ```bash
   git add lua/plugins/yourfile.lua lua/config/keymaps.lua
   git commit -m "Add plugin-name for X functionality"
   git push
   ```

### Changing LSP Servers

Edit `lua/plugins/lsp.lua`:

**Add to ensure_installed** (lines 72-76):
```lua
ensure_installed = {
    "pyright",
    "gopls",      -- Add Go LSP
    "rust_analyzer",  -- Add Rust LSP
},
```

**Add custom configuration** (lines 86-100):
```lua
gopls = function()
    require("lspconfig").gopls.setup({
        on_attach = lsp_attach,
        capabilities = capabilities,
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
            },
        },
    })
end,
```

### Changing Theme

1. Browse installed themes in `lua/plugins/themes.lua`
2. Set temporarily: `:colorscheme kanagawa` (or gruvbox, tokyonight, etc.)
3. Persist: Theme switcher writes to `lua/current-theme.lua`

### Modifying Global Settings

Edit `lua/config/general.lua`:

```lua
vim.opt.tabstop = 2              -- Change to 2 spaces
vim.opt.colorcolumn = "120"      -- Change line guide
vim.o.ignorecase = true          -- Enable case-insensitive search
```

**Don't modify**:
- Leader key setting (many plugins depend on Space leader)
- Netrw disable (file explorers depend on this)

### Removing Unused Plugins

1. Delete plugin spec from `lua/plugins/*.lua`
2. Remove related keybindings from `lua/config/keymaps.lua`
3. Restart Neovim
4. Run `:Lazy clean` to remove plugin files
5. Commit changes

## Version Control Workflow

This is a **personal configuration** synced via Git.

**Making changes**:
```bash
cd ~/.config/nvim
# Edit files
git add .
git commit -m "Description of changes"
git push
```

**Syncing to another machine**:
```bash
cd ~/.config/nvim
git pull
# Restart nvim - auto-updates plugins
```

**Tracking plugin versions**:
- `lazy-lock.json` locks exact plugin commits
- After major updates: `git add lazy-lock.json && git commit -m "Update plugins"`
- To sync exact versions on another machine: `:Lazy restore`

**What to commit**:
- ✅ Plugin specs in `lua/plugins/*.lua`
- ✅ Config files in `lua/config/*.lua`
- ✅ `init.lua`, `minimal_init.lua`
- ✅ `lazy-lock.json` (after intentional updates)
- ✅ `.gitignore`
- ❌ `lua/current-theme.lua` (theme state)
- ❌ `/plugin/` (auto-generated)
- ❌ `Session.vim` (session state)

## Resources & Documentation

**Plugin Documentation**:
- Lazy.nvim: https://github.com/folke/lazy.nvim
- LSP Zero: https://github.com/VonHeikemen/lsp-zero.nvim
- Which-key: https://github.com/folke/which-key.nvim
- Telescope: https://github.com/nvim-telescope/telescope.nvim
- Harpoon: https://github.com/ThePrimeagen/harpoon/tree/harpoon2

**Plugin List**:
- See README.md for full plugin catalog (auto-generated by Dotfyle)
- 50+ plugins across categories: LSP, completion, file explorers, git, AI, terminal, themes

**Getting Help**:
- `:help <plugin-name>` - Plugin docs (if available)
- `:Telescope help_tags` - Search all help tags
- `:checkhealth` - Diagnose issues
- `<leader>` (wait) - View all keybindings via which-key

**External Dependencies**:
- `ripgrep` - Required for Telescope file searching
- `fd` - Optional, improves file finding
- `Node.js` - Required for Copilot, some LSP servers
- `Python` - Required for pyright, debugpy
- `Ollama` - Required for CodeCompanion LLM features
- `git` - Required for plugin management
- `Yazi` - File manager (optional but recommended)

## Summary for AI Agents

**When working in this repository**:

1. **Never modify**: `lazy-lock.json` (unless explicitly updating plugins), `lua/current-theme.lua` (auto-generated)

2. **Plugin changes**: Add to `lua/plugins/*.lua`, keybindings to `lua/config/keymaps.lua`, restart to test

3. **LSP changes**: Edit `lua/plugins/lsp.lua`, ensure Mason dependencies installed

4. **Testing**: Use `:Lazy profile`, `:checkhealth`, `minimal_init.lua` for debugging

5. **Code style**: 4 spaces, Lua conventions, lazy-load everything possible

6. **Keybinding philosophy**: Use which-key groups, descriptive labels, follow existing patterns

7. **Documentation**: Update this file when adding significant features or changing workflows

8. **Python focus**: Primary language is Python, virtual env in `.venv`, pyright LSP

9. **AI tools**: Copilot for suggestions, CodeCompanion for chat (via local Ollama)

10. **File navigation**: Yazi preferred, Triptych for directory view, Harpoon for quick marks

This configuration prioritizes productivity, discoverability (which-key), and lazy-loading for performance. It's actively maintained and synced across machines via Git.
