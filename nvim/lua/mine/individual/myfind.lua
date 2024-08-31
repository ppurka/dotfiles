local M = {}

M = function()
    local ok = false
    if vim.g.have_git then
        local fh = assert(io.popen('git status --untracked-files=no --ignore-submodules=all 2>&1 | head -n 1'))
        ok = string.find(fh:read('*a'), 'fatal: ') == nil
        fh:close()
    end
    if ok then
        --vim.cmd([[Telescope git_files theme=dropdown]])
        pcall(require("telescope.builtin").git_files, {theme = "dropdown"})
    else
        --vim.cmd([[Telescope find_files theme=dropdown no_ignore=true]])
        pcall(require("telescope.builtin").find_files, {theme = "dropdown", no_ignore = true})
    end
end

return M
