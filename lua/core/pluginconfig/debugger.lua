
local dap = require('dap')

local function get_env()
    local env = os.getenv('VIRTUAL_ENV')
    if env then
        return env .. '/bin/python'
    else
        local home = os.getenv('HOME') .. '/.pyenv/versions/3.9.13/bin/python'
        return home
    end
end



dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/.pyenv/versions/3.9.13/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      p = get_env()
      return p
    end;
  },
}

require("dapui").setup()


WhichKey.register({
  ["["] = {
    name = "goto next",
    d = {vim.diagnostic.goto_next, "next diagnostics"},
  },
  ["]"] = {
    name = "goto prev",
    d = {vim.diagnostic.goto_prev, "previous diagnostic"},
  },
})

WhichKey.register({
  d = {
    name = "debug/diagnostic",
    t = {"<cmd>TroubleToggle<CR>", "toggle trouble"},
    T = {"<cmd>TodoTrouble<CR>", "toggle todo trouble"},
    D = {"<cmd>lua require'dapui'.toggle()<CR>", "toggle DAP"},
    b = {"<cmd>lua require'dap'.toggle_breakpoint()<CR>", "set breakpoint"},
    c = {"<cmd>lua require'dap'.continue()<CR>", "continue"},
    q = {"<cmd>copen<CR>", "Open quicklist"},
    p = {vim.diagnostic.goto_prev, "previous diagnostic"},
    d = {vim.diagnostic.goto_next, "next diagnostics"},
    e = {vim.diagnostic.open_float, "diagnostic open float"},
    l = {vim.diagnostic.setloclist, "diagnostic set loclist"},
  },
}, {prefix="<leader>"})

