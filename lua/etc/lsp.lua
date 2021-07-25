local lsp = vim.lsp

local Cfg = require("lspconfig")  -- for installing and configuring individual language servers
local Saga = require("lspsaga")
local Provider = require("lspsaga/provider")
local Action = require("lspsaga/codeaction")

-- general config, via lspsaga
Saga.init_lsp_saga({
    use_saga_diagnostic_sign = true,
    error_sign = " ",
    warn_sign = " ",
    hint_sign = " ",
    infor_sign = " ",
    dianostic_header_icon = "   ",
    code_action_icon = "𝔄",
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_definition_icon = "𝔇 ",
    finder_reference_icon = "𝔯 ",
    max_preview_lines = 16, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
        open = "o", vsplit = "s",split = "i", quit = "q",scroll_down = "<C-f>", scroll_up = "<C-b>", -- quit can be a table
    },
    code_action_keys = {
      quit = "q", exec = "<CR>",
    },
    rename_action_keys = {
      quit = "<C-c>", exec = "<CR>",  -- quit can be a table
    },
    definition_preview_icon = "𝔇 ",
    -- "single" "double" "round" "plus"
    border_style = "round",
    rename_prompt_prefix = "➤",
})


-- Python LSP
Cfg.pyright.setup({})

WhichKey.register({
    ["."] = {
        name = "the infamous LSP",
        X = {function() lsp.stop_client(lsp.get_active_clients()) end, "stop all LSP clients", noremap=true},
        f = {"<cmd>Lspsaga lsp_finder<CR>", "open LSP finder", noremap=true},
        a = {Action.code_action, "open LSP action", noremap=true},
    },
}, {prefix="<leader>"})
