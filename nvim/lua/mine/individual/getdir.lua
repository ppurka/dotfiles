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

