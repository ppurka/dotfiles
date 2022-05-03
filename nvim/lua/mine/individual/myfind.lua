local M = {}

M.myfind_files = function()
    -- original code
    --local ok = pcall(require"telescope.builtin".git_files, {theme = "dropdown"})
    --if not ok then require"telescope.builtin".find_files({theme = "dropdown", no_ignore = true}) end
    --
    -- All the dance below because require"telescope.builtin".git_files()
    -- does not honor theme=dropdown
    -- Telescope command does
    local fh = assert(io.popen('git status 2>&1 | head -n 1'))
    local ok = string.find(fh:read('*a'), 'fatal: ') == nil
    fh:close()
    if ok then
        --require"telescope.builtin".git_files({theme = "dropdown"})
        vim.cmd([[Telescope git_files theme=dropdown]])
    else
        require"telescope.builtin".find_files({theme = "dropdown", no_ignore = true})
    end
end

return M
