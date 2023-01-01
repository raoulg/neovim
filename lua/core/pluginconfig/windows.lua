WhichKey.register({
  w = {
    name = "windows",
    w = { "<C-w>w", "other window" },
    f = { "<C-w>|", "maximize window" },
    d = { "<C-w>c", "delete window" },
    ["-"] = { "<C-w>s", "split window below" },
    ["|"] = { "<C-w>v", "split window right" },
    h = { "<C-w>h", "window left" },
    H = { "<C-w>10>", "expand window right" },
    j = { "<C-w>j", "window below" },
    J = { "<cmd>resize +10<CR>", "expand window down" },
    k = { "<C-w>k", "window up" },
    K = { "<cmd>resize -10<CR>", "expand window up" },
    l = { "<C-w>l", "window right" },
    L = { "<C-w>10<", "expand window left" },
    ["="] = { "<C-w>=", "balance windows" },
    n = { "<cmd>FocusSplitNicely<CR>", "split nicely" },
    t = { "<cmd>FocusToggle<CR>", "toggle focus" },
    c = { "<cmd>FocusSplitCycle<CR>", "cycle focus splits" },


  },

}, { prefix = "<leader>" })
