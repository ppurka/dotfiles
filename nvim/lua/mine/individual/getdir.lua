-- Get the parent directory containing the pattern provided.
-- The pattern can be string or a table of strings
-- The returned directory name corresponds to the first string in the pattern
-- table that is matched.
-- If there is no match, it will return nil

-- neovim v0.10 and higher has an in-built function
local M = function(arg)
    local pattern = type(arg) == "table" and arg or {arg}
    return vim.fs.root(0, pattern)
end

return M

-- My old implementation
-- --
-- -- This function will search through at most CNT_MAX parent directories
-- --
-- local M = {}
-- local CNT_MAX = 10
-- 
-- local function exists(path)
--     does_exist = false
--     local fid  = io.open(path)
--     if fid ~= nil then
--         io.close(fid)
--         does_exist = true
--     end
--     return does_exist
-- end
-- 
-- M = function(arg)
--     local pattern = type(arg) == "table" and arg or {arg}
--     local found   = false
--     local currdir = vim.fn.getcwd()
--     local founddir= nil
--     -- recurse through up to CNT_MAX parent directories, trying to find the
--     -- first pattern that can be matched in that order.
--     -- We start from current directory.
--     for _, pat in ipairs(pattern) do
--         if exists(pat) then                         -- check current directory
--             founddir = currdir
--             break
--         end
-- 
--         local prefix = ""
--         local count  = 0
-- 
--         while not found and count < CNT_MAX do      -- next, recurse up
--             prefix = "../" .. prefix
--             found  = exists(prefix .. pat)
--             count  = count + 1
--         end
-- 
--         if found then
--             vim.cmd("cd " .. prefix)
--             founddir = vim.fn.getcwd()
--             vim.cmd("cd " .. currdir)
--             break
--         end
--     end
-- 
--     return founddir
-- end
-- 
-- return M
