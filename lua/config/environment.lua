-- Environment detection and profile management
-- This file determines which features/plugins to enable based on the current environment

local M = {}

-- Detect operating system (use vim.uv or vim.loop for compatibility)
local uv = vim.uv or vim.loop
local uname = uv.os_uname()

M.os = uname.sysname
M.is_mac = M.os == "Darwin"
M.is_linux = M.os == "Linux"
M.is_windows = M.os:find("Windows") ~= nil

-- Get hostname using vim.fn.hostname() (more reliable across platforms)
M.hostname = vim.fn.hostname()

-- Define your laptop hostname(s) for full feature set
local FULL_HOSTS = {
    ["MacBook-Pro-2.local"] = true,
    -- Add other hostnames where you want full setup:
    -- ["your-laptop-name"] = true,
}

-- Check if running on known full-featured machine
M.is_full_machine = FULL_HOSTS[M.hostname] or false

-- Alternatively, use macOS as indicator for full setup
-- Uncomment this line if you want ALL macOS machines to be "full"
-- M.is_full_machine = M.is_mac

-- Determine profile: "full" or "minimal"
M.profile = M.is_full_machine and "full" or "minimal"

-- Feature flags based on profile
M.features = {
    -- AI/External services (require authentication/external setup)
    copilot = M.profile == "full",
    activity_watch = M.profile == "full",
    codecompanion = M.profile == "full", -- Requires Ollama

    -- LSP servers that need npm
    npm_lsp = M.profile == "full",

    -- Heavy UI features
    animations = M.profile == "full",
    image_preview = M.profile == "full",

    -- Git blame (can be resource intensive)
    git_blame = M.profile == "full",

    -- Note-taking (telekasten - might be laptop-specific)
    telekasten = M.profile == "full",
}

-- Dependency detection (check if tools are available)
local function executable_exists(name)
    return vim.fn.executable(name) == 1
end

M.has = {
    npm = executable_exists("npm"),
    node = executable_exists("node"),
    python = executable_exists("python") or executable_exists("python3"),
    cargo = executable_exists("cargo"),
    go = executable_exists("go"),
    ollama = executable_exists("ollama"),
    yazi = executable_exists("yazi"),
}

-- Override features based on actual dependencies
-- (e.g., even on full machine, disable if dependency missing)
if not M.has.npm then
    M.features.npm_lsp = false
end

if not M.has.ollama then
    M.features.codecompanion = false
end

-- Helper function to check if a plugin should load
function M.should_load(feature_name)
    if feature_name == nil then
        return true -- No feature flag = always load
    end
    return M.features[feature_name] == true
end

-- Debug info (can be viewed with :lua print(vim.inspect(require('config.environment'))))
M.debug_info = function()
    return {
        os = M.os,
        hostname = M.hostname,
        profile = M.profile,
        features = M.features,
        dependencies = M.has,
    }
end

-- Set global for easy access in plugin specs
vim.g.nvim_profile = M.profile
vim.g.nvim_features = M.features

return M
