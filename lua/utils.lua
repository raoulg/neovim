
function sethighlight(syntax, opts)
    local bg = opts.bg == nil and "guibg=NONE" or "guibg=" .. opts.bg
    local fg = opts.fg == nil and "guifg=NONE" or "guifg=" .. opts.fg
    -- note that style is a comma separated list e.g. "underline,bold,italic"
    local style = opts.style == nil and "gui=NONE" or "gui=" .. opts.style

    vim.cmd("hi "..syntax.." "..bg.." "..fg.." "..style)
end

-- this is a lighter version of the above because hi is so inefficient...
-- but don't use this exclusively, as it doesn't set what it's not passed
function sethighlightsimple(syntax, opts)
    local c = "hi "..syntax.." "
    if opts.bg ~= nil then
        c = c.."guibg="..opts.bg
    end
    if opts.fg ~= nil then
        c = c.."guifg="..opts.fg
    end
    if opts.style ~= nil then
        c = c.."gui="..opts.style
    end
    vim.cmd(c)
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

function reloadconfig()
    for name, _ in pairs(package.loaded) do
        if name:match("^etc") then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
end
