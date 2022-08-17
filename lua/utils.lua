
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
