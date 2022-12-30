local Bufferline = require("bufferline")

local function print_numbers(opts)
    return string.format("%s", opts.raise(opts.ordinal), opts.raise((opts.id)))
end

Bufferline.setup({
options = {
        numbers = print_numbers,
    }
})

local function temporal_compare(buf1, buf2)
    local t1 = vim.loop.fs_stat(buf1.path).mtime.sec
    local t2 = vim.loop.fs_stat(buf2.path).mtime.sec
    return t1 > t2
end

local function open_split_buf(n, vert)
    return function()
        require("bufferline.commands").exec(n, function(buf, all_visible)
            local str = vert and "vert sbuffer " or "sbuffer "
            vim.cmd(str..buf.id)
        end)
    end
end


WhichKey.register({
    name = "manage buffers and tabs",
    ["]"] = {function() return Bufferline.cycle(1) end, "cycle next"},
    ["["] = {function() return Bufferline.cycle(-1) end, "cycle previous"},
    ["}"] = {function() return Bufferline.move(1) end, "move to next"},
    ["{"] = {function() return Bufferline.move(-1) end, "move to previous"},
    E = {function() return Bufferline.sort_buffers_by("extension") end, "sort buffers by extension"},
    S = {function() return Bufferline.sort_buffers_by("directory") end, "sort buffers by directory"},
    t = {function() return Bufferline.sort_buffers_by(temporal_compare) end, "sort buffers by last modified"},
    T = {function() return Bufferline.sort_buffers_by("tabs") end, "sort buffers by tabs"},
    x = {function() return vim.cmd("bd") end, "close current buffer"},
    d = {function() return Bufferline.close_buffer_with_pick() end, "pick buffer to close"},
    p = {function() return Bufferline.pick_buffer() end, "pick a buffer"},
    [","] = {function() return Bufferline.close_in_direction("left") end, "close all buffers to the left"},
    ["."] = {function() return Bufferline.close_in_direction("right") end, "close all buffers to the right"},

    ["1"] = {function() return Bufferline.go_to_buffer(1, true) end, "go to buffer 1"},
    ["2"] = {function() return Bufferline.go_to_buffer(2, true) end, "go to buffer 2"},
    ["3"] = {function() return Bufferline.go_to_buffer(3, true) end, "go to buffer 3"},
    ["4"] = {function() return Bufferline.go_to_buffer(4, true) end, "go to buffer 4"},
    ["5"] = {function() return Bufferline.go_to_buffer(5, true) end, "go to buffer 5"},
    ["6"] = {function() return Bufferline.go_to_buffer(6, true) end, "go to buffer 6"},
    ["7"] = {function() return Bufferline.go_to_buffer(7, true) end, "go to buffer 7"},
    ["8"] = {function() return Bufferline.go_to_buffer(8, true) end, "go to buffer 8"},
    ["9"] = {function() return Bufferline.go_to_buffer(9, true) end, "go to buffer 9"},
    ["0"] = {function() return Bufferline.go_to_buffer(10, true) end, "go to buffer 10"},

    ["s1"] = {open_split_buf(1, false), "open buffer 1 in new split"},
    ["s2"] = {open_split_buf(2, false), "open buffer 2 in new split"},
    ["s3"] = {open_split_buf(3, false), "open buffer 3 in new split"},
    ["s4"] = {open_split_buf(4, false), "open buffer 4 in new split"},
    ["s5"] = {open_split_buf(5, false), "open buffer 5 in new split"},
    ["s6"] = {open_split_buf(6, false), "open buffer 6 in new split"},
    ["s7"] = {open_split_buf(7, false), "open buffer 7 in new split"},
    ["s8"] = {open_split_buf(8, false), "open buffer 8 in new split"},
    ["s9"] = {open_split_buf(9, false), "open buffer 9 in new split"},
    ["s0"] = {open_split_buf(10, false), "open buffer 10 in new split"},

    ["v1"] = {open_split_buf(1, true), "open buffer 1 in new vertical split"},
    ["v2"] = {open_split_buf(2, true), "open buffer 2 in new vertical split"},
    ["v3"] = {open_split_buf(3, true), "open buffer 3 in new vertical split"},
    ["v4"] = {open_split_buf(4, true), "open buffer 4 in new vertical split"},
    ["v5"] = {open_split_buf(5, true), "open buffer 5 in new vertical split"},
    ["v6"] = {open_split_buf(6, true), "open buffer 6 in new vertical split"},
    ["v7"] = {open_split_buf(7, true), "open buffer 7 in new vertical split"},
    ["v8"] = {open_split_buf(8, true), "open buffer 8 in new vertical split"},
    ["v9"] = {open_split_buf(9, true), "open buffer 9 in new vertical split"},
   ["v10"] = {open_split_buf(10, true), "open buffer 10 in new vertical split"},
}, {prefix=";"})


