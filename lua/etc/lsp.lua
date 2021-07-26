local lsp = vim.lsp

local Cfg = require("lspconfig")  -- for installing and configuring individual language servers
local Saga = require("lspsaga")
local Provider = require("lspsaga/provider")
local Action = require("lspsaga/codeaction")
local Hover = require("lspsaga/hover")
local SignatureHelp = require("lspsaga/signaturehelp")
local Rename = require("lspsaga/rename")
local Diagnostic = require("lspsaga/diagnostic")

-- TODO: will basically need your own plugin to make these easily toggleable; in the meantime, this
-- is a reasonable default, see https://github.com/nvim-lua/diagnostic-nvim/issues/73
lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = true,
})

-- general config, via lspsaga
Saga.init_lsp_saga({
    use_saga_diagnostic_sign = true,
    error_sign = " ",
    warn_sign = " ",
    hint_sign = " ",
    infor_sign = " ",
    dianostic_header_icon = "ℒ ",
    code_action_icon = "𝔄",
    code_action_prompt = {
        enable = false,
        sign = false,
        sign_priority = 20,
        virtual_text = false,
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


WhichKey.register({
    ["."] = {
        name = "the infamous LSP",
        X = {function() lsp.stop_client(lsp.get_active_clients()) end, "stop all LSP clients", noremap=true},
        f = {"<cmd>Lspsaga lsp_finder<CR>", "open LSP finder", noremap=true},
        a = {Action.code_action, "open LSP action", noremap=true},
        d = {Hover.render_hover_doc, "view docs", noremap=true},
        s = {SignatureHelp.signature_help, "help with signature", noremap=true},
        r = {Rename.rename, "rename", noremap=true},
        v = {Provider.preview_definition, "preview definition", noremap=true},
        ["1"] = {Diagnostic.show_line_diagnostics, "show line diagnostics", noremap=true},
        ["2"] = {Diagnostic.show_cursor_diagnostics, "show cursor diagnostics", noremap=true},
        ["]"] = {Diagnostic.lsp_jump_diagnostic_next, "jump to next diagnostic", noremap=true},
        ["["] = {Diagnostic.lsp_jump_diagnostic_prev, "jump to previous diagnostic", noremap=true},
    },
}, {prefix="<leader>"})

linkhighlight("LspSagaFinderSelection", "Search")
sethighlight("LspSagaFloatWinNormal", {fg="NONE", bg=bgdark})
sethighlight("LspFloatWinBorder", {fg=colors.pink, bg="NONE"})
sethighlight("LspSagaBorderTitle", {fg=colors.purple, bg="NONE"})
sethighlight("LspLinesDiagBorder", {fg=colors.comment, bg="NONE"})
sethighlight("LspSagaRenameBorder", {fg=colors.comment, bg="NONE"})
sethighlight("LspSagaHoverBorder", {fg=colors.comment, bg="NONE"})
sethighlight("LspSagaSignatureHelpBorder", {fg=colors.comment, bg="NONE"})
sethighlight("LspSagaCodeActionBorder", {fg=colors.pink, bg="NONE"})
sethighlight("LspSagaAutoPreview", {fg=colors.comment, bg="NONE"})
sethighlight("LspSagaDiagnosticBorder", {fg=colors.comment, bg="NONE"})
sethighlight("LspSagaDiagnosticTruncateLine", {fg=colors.comment, bg="NONE"})

-- ------------------------------ languages ----------------------------------------
-- ---------------------------------------------------------------------------------

-- NOTE: LSP only enabled for types listed here;
_G.LSP_FILETYPES = {
    --julia = {},  --FUCK: this still doesn't work that well; will really have to mess with it
    python = {},
}

-- Julia
if LSP_FILETYPES["julia"] ~= nil then
_julia_lsp_cmd = {"julia", "--startup-file=no", "--history-file=no", vim.fn.stdpath("config").."/lsp/lsp.jl"}
Cfg.julials.setup({
    cmd = _julia_lsp_cmd,
    on_new_config = function(cfg, _)
        cfg.cmd = _julia_lsp_cmd
    end,
    filetypes={"julia"},
})
end
--vim.lsp.set_log_level("debug")

-- Python
if LSP_FILETYPES["python"] ~= nil then
Cfg.pyright.setup({})
end

