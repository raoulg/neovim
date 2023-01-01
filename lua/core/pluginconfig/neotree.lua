Neotree = require("neo-tree")

Neotree.setup({
  close_if_last_window = true,
  filesystem = {
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
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
