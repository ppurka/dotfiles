local M = {}
local CNT_MAX = 3

local function exists(path)
    does_exist = false
    local fid  = io.open(path)
    if fid ~= nil then
        io.close(fid)
        does_exist = true
    end
    return does_exist
end

M.grep_string = function()
    local found   = false
    local pattern = {".git", "tags"}
    -- recurse through up to CNT_MAX parent directories, trying to find either
    --      .git directory
    --      tags file
    -- in that order.
    -- If that fails, then we search current directory.
    -- Otherwise, go up to parent directory that has .git or tags
    for _, pat in ipairs(pattern) do
        local prefix = ""
        local count  = 0
        if exists(pat) then                         -- check current directory
            prefix = "."
            found  = true
        end

        while not found and count < CNT_MAX do      -- next, recurse up
            prefix = "../" .. prefix
            found  = exists(prefix .. pat)
            count  = count + 1
        end
        if found then
            vim.cmd("cd " .. prefix)
            break
        end
    end

    vim.cmd([[Telescope grep_string theme=dropdown]])
end

return M
