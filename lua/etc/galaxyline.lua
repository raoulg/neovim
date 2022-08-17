local GalaxyLine = require("galaxyline")

local Condition = require("galaxyline.condition")
local Section = GalaxyLine.section

local Buffer = require("galaxyline.provider_buffer")
local FileInfo = require("galaxyline.provider_fileinfo")
local Extension = require("galaxyline.provider_extensions")
local Whitespace = require("galaxyline.provider_whitespace")
-- the galaxyline icon providers are FUBAR, so we need this
local DevIcons = require("nvim-web-devicons")
local LuapadInfo = require("luapad.statusline")

local function getfileinfo()
    return vim.fn.expand("%:t"), vim.fn.expand("%:e")
end

local function fileicon()
    n, e = getfileinfo()
    return DevIcons.get_icon(n, e, {default=true})
end

-- TODO: improve whitespace

local mode_cfg = {
    n = {name="normal", fg=colors.purple},
    i = {name="insert", fg=colors.green},
    R = {name="replace", fg=colors.red},
    v = {name="visual", fg=colors.orange},
    V = {name="v-line", fg=colors.orange},
    [""] = {name="v-block", fg=colors.orange},
    s = {name="select", fg=colors.pink},
    S = {name="s-line", fg=colors.pink},
    [""] = {name="s-block", fg=colors.pink},
    c = {name="command", fg=colors.cyan},
    t = {name="terminal", fg=colors.green},
    Rv = {name="virtual", fg=colors.pink},
    rm = {name="--more", fg=colors.pink},
    unknown = {name="UNKNOWN", fg=colors.subtle},
}

local function modeprovider()
    local c = mode_cfg[vim.fn.mode()]
    if c == nil then
        local c = mode_cfg["unknown"]
    end
    vim.api.nvim_set_hl(0, "GalaxyViMode", {fg=c.fg, bg=colors.bgdark})
    return "▮"..padtolength(c.name, 10, " ").."▮"
end

table.insert(Section.left, {
    LeftMostSeparator = {
        provider = function() return "◖" end,
        highlight = {colors.purple, colors.bgdark},
    },
})

vim.api.nvim_set_hl(0, "GalaxyViMode", {fg=colors.purple, bg=colors.bgdark})

table.insert(Section.left, {
    ViMode = {
        provider = modeprovider,
        separator = "◗   ",
        separator_highlight = {colors.purple, colors.bgdark},
        highlight = {nil, colors.bgdark},
    },
})

table.insert(Section.left, {
    GitIcon = {
        provider = function()
            return ""
        end,
        condition = Condition.check_git_workspace,
        separator = " ",
        separator_highlight = {nil, colors.bgdark},
        highlight = {colors.orange, colors.bgdark},
    },
})

table.insert(Section.left, {
    GitBranch = {
        provider = "GitBranch",
        condition = Condition.check_git_workspace,
        separator = " ",
        separator_highlight = {nil, colors.bgdark},
        highlight = {colors.comment, colors.bgdark},
    },
})

-- TODO git stuff needs git plugin to function properly! might need custom functions

table.insert(Section.left, {
    DiffAdd = {
        provider = "DiffAdd",
        condition = Condition.hide_in_width,
        icon = "  ",
        highlight = {colors.green, colors.bgdark},
    },
})

table.insert(Section.left, {
    DiffModified = {
        provider = "DiffModified",
        condition = Condition.hide_in_width,
        icon = " ^ ",
        highlight = {colors.purple, colors.bgdark},
    },
})

table.insert(Section.left, {
    Filler = {
        provider = function()
            return " "
        end,
        highlight = {colors.bglighter, colors.bgdark},
    },
})

table.insert(Section.right, {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.bgdark},
    },
})
table.insert(Section.right, {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.orange, colors.bgdark},
    },
})

table.insert(Section.right, {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = {colors.yellow, colors.bgdark},
    },
})

table.insert(Section.right, {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = {colors.purple, colors.bgdark},
    },
})

local function luapad_provider()
    local s = LuapadInfo.status()
    if s == nil then return nil end
    if s == "ok" then
        vim.api.nvim_set_hl(0, "GalaxyLuapad", {fg=colors.green})
    else
        vim.api.nvim_set_hl(0, "GalaxyLuapad", {fg=colors.orange})
    end
    return " ⟦ Luapad: "..s.." ⟧ "
end

vim.api.nvim_set_hl(0, "GalaxyLuapad", {fg=colors.orange, bg=colors.bgdark})

table.insert(Section.right, {
    Luapad = {
        provider = luapad_provider,
        highlight = {colors.pink, colors.bgdark},
    },
})

table.insert(Section.right, {
    Whitespace = {
        provider = Whitespace.get_item,
        highlight = {colors.orange, colors.bgdark},
    }
})

-- only show if active client exists
local function lspcondition()
    local clients = vim.lsp.get_active_clients()
    return next(clients) ~= nil
end

-- returns text listing LSP clients
function getlspclient(msg)
    msg = msg or "LSP inactive"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return "("..msg..")"
    end
    local lsps = ""
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            -- print(client.name)
            if lsps == "" then
                -- print("first", lsps)
                lsps = client.name
            else
                if not string.find(lsps, client.name) then
                    lsps = lsps .. ", " .. client.name
                end
                -- print("more", lsps)
            end
        end
    end
    if lsps == "" then
        return "("..msg..")"
    else
        return "("..lsps..")"
    end
end

table.insert(Section.right, {
    ShowLspClient = {
        provider = getlspclient,
        condition = lspcondition,
        icon = " ",
        separator = "  ",
        highlight = {colors.subtle, colors.bgdark},
        separator_highlight = {colors.subtle, colors.bgdark},
    },
})

table.insert(Section.right, {
    RightStartSeparator = {
        provider = function() return "◖" end,
        separator = "    ",
        highlight = {colors.purple, colors.bgdark},
        separator_highlight = {colors.bgdark, colors.bgdark},
    },
})

local function modified_buffer_indicator(hl)
    return function()
        if vim.bo.modifiable and vim.bo.modified then
            return "▮"
        else
            return "▯"
        end
    end
end

table.insert(Section.right, {
    ModifiedBufferIndicator = {
        provider = modified_buffer_indicator("GalaxyModifiedBufferIndicator"),
        highlight = {colors.orange, colors.bgdark},
    },
})

table.insert(Section.right, {
    FileName = {
        provider = function()
            return vim.fn.expand("%:t")
        end,
        separator = " ",
        highlight = {colors.cyan, colors.bgdark},
        separator_highlight = {colors.purple, colors.bgdark},
    },
})

local function isreadonly_provider()
    if vim.bo.readonly then return "" end
    return " "
end

table.insert(Section.right, {
    FileIsReadOnly = {
        provider = isreadonly_provider,
        separator = " ",
        highlight = {colors.red, colors.bgdark},
        separator_highlight = {colors.purple, colors.bgdark},
    },
})

table.insert(Section.right, {
    FileTypeName = {
        provider = function()
            return string.lower(Buffer.get_buffer_filetype())
        end,
        separator = " ▮ ",
        highlight = {colors.selection, colors.bgdark},
        separator_highlight = {colors.purple, colors.bgdark},
    },
})

table.insert(Section.right, {
    FileIcon = {
        provider = fileicon,
        separator = " ",
        highlight = {colors.cyan, colors.bgdark},
        separator_highlight = {colors.purple, colors.bgdark},
    },
})

local function line_info_provider()
    local l = vim.fn.line(".")
    local n = vim.fn.line("$")
    local c = vim.fn.col(".")
    return string.format("㏑%3d ⌊%3d :%2d ", l, n, c)
end

table.insert(Section.right, {
    LineInfo = {
        provider = line_info_provider,
        separator = " ▮ ",
        separator_highlight = {colors.purple, colors.bgdark},
        highlight = {colors.comment, colors.bgdark},
    },
})

table.insert(Section.right, {
    FileSize = {
        provider = "FileSize",
        separator = " ▮ ",
        separator_highlight = {colors.purple, colors.bgdark},
        highlight = {colors.comment, colors.bgdark},
    }
})

table.insert(Section.right, {
    Scroll = {
        provider = Extension.scrollbar_instance,
        separator = " ",
        separator_highlight = {nil, colors.bgdark},
        highlight = {colors.pink, colors.bgdark},
    },
})


-- short line for special buffer types
GalaxyLine.short_line_list = {"NvimTree", "packer", "dbui", "term", "toggleterm"}

table.insert(Section.short_line_left, {
    ShortLineSeparator = {
        provider = function() return " ◖ " end,
        highlight = {colors.purple, colors.bgdark},
    },
})

table.insert(Section.short_line_left, {
    ShortLineFileType = {
        provider = function()
            local s = string.lower(Buffer.get_buffer_filetype())
            -- TODO: probably need regex to catch special cases generated by term://
            if s == "terminal" or s == "toggleterm" then
                icon = DevIcons.get_icon("zsh", "zsh", {default=true}).." "
            else
                icon = ""
            end
            return icon..s
        end,
        condition = Condition.buffer_not_empty,
        highlight = {colors.yellow, colors.bgdark},
        separator = " ▮ ",
        separator_highlight = {colors.purple, colors.bgdark},
    },
})

table.insert(Section.short_line_left, {
    ShortLineFileName = {
        provider = function()
            return vim.fn.expand("%:t")
        end,
        separator = " ",
        highlight = {colors.subtle, colors.bgdark},
        separator_highlight = {colors.bgdark, colors.bgdark},
    },
})

table.insert(Section.short_line_left, {
    ShortModifiedBufferIndicator = {
        provider = modified_buffer_indicator("GalaxyShortModifiedBufferIndicator"),
        highlight = {colors.orange, colors.bgdark},
    },
})

table.insert(Section.short_line_left, {
    ShortLeftSeparator = {
        provider = function() return "" end,
        separator = "◗ ",
        highlight = {colors.bgdark, colors.bgdark},
        separator_highlight = {colors.purple, colors.bgdark},
    },
})

table.insert(Section.short_line_right, {
    BufferIcon = {
        provider = "BufferIcon",
        highlight = {colors.cyan, colors.bgdark},
    },
})
