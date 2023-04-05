Neotree = require("neo-tree")

Neotree.setup({
  close_if_last_window = true,

  filesystem = {
    follow_current_file = false,
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        ".DS_Store",
        ".git",
        ".vscode",
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
  },

  buffers = {
    follow_current_file = false,
  },

  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd 'setlocal relativenumber'
      end
    },
  }

})

WhichKey.register({
  n = { "<cmd>Neotree toggle<CR>", "Neotree" },
}, { prefix = "<leader>" })
