local Lualine = require("lualine")

local theme = {
    normal = {
        a = {bg=colors.bgdark, fg=colors.purple},
        b = {bg=colors.bgdark, fg=colors.selection},
        c = {bg=colors.bgdark, fg=colors.selection},
        x = {bg=colors.bgdark, fg=colors.comment},
        y = {bg=colors.bgdark, fg=colors.comment},
        z = {bg=colors.bgdark, fg=colors.comment},
    },
    insert = {
        a = {bg=colors.bgdark, fg=colors.green},
    },
    visual = {
        a = {bg=colors.bgdark, fg=colors.orange},
    },
    replace = {
        a = {bg=colors.bgdark, fg=colors.red},
    },
    command = {
        a = {bg=colors.bgdark, fg=colors.cyan},
    },
    inactive = {
        a = {bg=colors.bgdark, fg=colors.comment},
    },
}

local scroll_bar_blocks = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }

local function leftbrack(col)
    return {
        function()
            return "◖"
        end,
        color = {fg=col},
        padding = {left=1, right=0},
    }
end

local function rightbrack(col)
    return {
        function()
            return "◗"
        end,
        color = {fg=col},
        padding = {left=0, right=1},
    }
end

local function divider(col)
    return {
        function()
            return "▮"
        end,
        color = {fg=col},
        padding = 1,
    }
end

local function scrollbar()
    local l = vim.api.nvim_win_get_cursor(0)[1]
    local n = vim.api.nvim_buf_line_count(0)
    return scroll_bar_blocks[8 - math.floor(l/n * 7)]
end

local function special_filetype_icon(default)
    local ft = vim.bo.filetype
    if ft == "terminal" or ft == "term" or ft == "toggleterm" then
        return " "
    elseif ft == "NvimTree" then
        return " "
    else
        return default
    end
end

local mode_component = {
    "mode",
    icons_enabled = true,
    fmt = function(o)
        return "▮ "..string.lower(o).." ▮"
    end,
    padding = 0,
}

local filename_icon_componenent = {
    function()
        if special_filetype_icon("") ~= "" then
            return ""
        elseif vim.bo.modified then
            return "▮"
        elseif (not vim.bo.modifiable) or vim.bo.readonly then
            return "🔒"
        else
            return "▯"
        end
    end,
    color = function(section)
        if vim.bo.modified then
            return {fg=colors.orange, bg=colors.bgdark}
        elseif (not vim.bo.modifiable) or vim.bo.readonly then
            return {fg=colors.red, bg=colors.bgdark}
        else
            return {fg=colors.purple, bg=colors.bgdark}
        end
    end,
    padding = 0,
}

local function filename_component(col)
    return {
        "filename",
        newfile_status = true,
        file_status = false,
        symbols = {
            newfile = "✽",
        },
        color = {fg=col, bg=colors.bgdark},
        fmt = function(o)
            return special_filetype_icon(o)
        end,
        padding = 0,
    }
end

local filetype_component = {
    "filetype",
    icon = {align="left"},
}

local location_prefix = {
    function()
        return "㏑"
    end,
    color = {fg=colors.comment, bg=colors.bgdark},
}

local scrollbar_component = {
    "progress",
    fmt = function(s)
        return scrollbar()
    end,
    color = {fg=colors.pink, bg=colors.bgdark},
}

local config = {
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = "",
        section_separators = "",
        ignore_focus = {
            "term",
            "terminal",
            "toggleterm",
            "NvimTree",
        },
    },
    sections = {
        lualine_a = {leftbrack(colors.purple), mode_component, rightbrack(colors.purple)},
        lualine_b = {"branch", "diff"},
        lualine_c = {},
        lualine_x = {leftbrack(colors.purple), filename_icon_componenent, filename_component(colors.cyan)},
        lualine_y = {divider(colors.purple), filetype_component},
        lualine_z = {divider(colors.purple), location_prefix, "location", scrollbar_component},
    },
    inactive_sections = {
        lualine_a = {
            leftbrack(colors.purple),
            filename_icon_componenent,
            filename_component(colors.comment),
            divider(colors.purple),
        },
        lualine_b = {filetype_component, rightbrack(colors.purple)},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}


Lualine.setup(config)
