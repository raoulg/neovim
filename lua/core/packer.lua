-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd([[packadd packer.nvim]]) end


-- LSP
-- Autocompletion
-- treesitter
-- debugger
-- Appearance
-- themes
-- buffers
-- statuslines
-- improved-commandline
-- terminal-and-repl
-- sessionmanagement
-- navigation/jumping
-- Git --
-- Fuzzy-Finder (files, lsp, etc)
-- spotify
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  }

  use {'github/copilot.vim', branch = 'release' }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  -- Additional text objects via treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- languages
  use "lervag/vimtex"

  -- debugger
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }

  -- Appearance
  -- themes
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'navarasu/onedark.nvim'
  use 'gbprod/nord.nvim'
  use 'Abstract-IDE/Abstract-cs'
  use "EdenEast/nightfox.nvim"
  use "ellisonleao/gruvbox.nvim"
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'mzlogin/vim-markdown-toc'
  use 'ellisonleao/glow.nvim'
  use 'folke/zen-mode.nvim'



  -- buffers
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use 'mhinz/vim-startify'
  use 'beauwilliams/focus.nvim'

  -- statuslines
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'feline-nvim/feline.nvim'

  -- improved-commandline
  use "romgrk/fzy-lua-native"
  use "gelguy/wilder.nvim"

  -- terminal-and-repl
  use 'akinsho/toggleterm.nvim' --
  use 'hkupty/iron.nvim'

  -- sessionmanagement
  -- use "rmagatti/auto-session"
  -- use "rmagatti/session-lens"
  -- use "olimorris/persisted.nvim"
  use {
    'jedrzejboczar/possession.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- navigation/jumping
  use 'folke/which-key.nvim'
  use 'stevearc/aerial.nvim'
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  -- use {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   }
  -- }
  -- use {'ms-jpq/chadtree', branch = 'chad', run = 'python -m chadtree deps' }
  -- use {'TimUntersberger/neofs.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use { 'ThePrimeagen/harpoon', requires = "nvim-lua/plenary.nvim" }

  -- Git --
  use 'tpope/vim-fugitive' --
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use 'rbong/vim-flog'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy-Finder (files, lsp, etc)
  use "ggandor/leap.nvim"
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use "ahmedkhalf/project.nvim"
  use 'cljoly/telescope-repo.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { 'renerocksai/telekasten.nvim', requires = 'renerocksai/calendar-vim' }
  use {'nvim-orgmode/orgmode', config = function()
      require('orgmode').setup{}
    end
  }

  -- spotify
  -- use 'srishanbhattarai/neovim-spotify'

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this file
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = 'packages.lua',
})
