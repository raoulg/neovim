
function sethighlight(syntax, opts)
    local bg = opts.bg == nil and "" or "guibg=" .. opts.bg
    local fg = opts.fg == nil and "" or "guifg=" .. opts.fg
    -- note that style is a comma separated list e.g. "underline,bold,italic"
    local style = opts.style == nil and "" or "gui=" .. opts.style

    vim.cmd(string.format("hi %s %s %s %s", syntax, bg, fg, style))
end

function linkhighlight(s1, s2)
    vim.cmd(string.format("hi! link %s %s", s1, s2))
end

-- this is to work around an annoying issue #12544
function appendvimglobal(var, k, v)
    local tmp = vim.g[var]
    tmp[k] = v
    vim.g[var] = tmp
end

-- pad a string to a specified length
function padtolength(s, n, c)
    delta = n - string.len(s)
    lpad = math.ceil(delta/2)
    rpad = math.floor(delta/2)
    return string.rep(c, lpad)..s..string.rep(c, rpad)
end

-- returns text listing LSP clients
function getlspclient(msg)
    msg = msg or "(LSP inactive)"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
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
        return msg
    else
        return lsps
    end
end

