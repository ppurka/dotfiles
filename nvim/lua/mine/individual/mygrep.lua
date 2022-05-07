local M = {}
local getdir = require("mine.individual.getdir")

M = function()
    local parentdir = getdir({".git", "tags"})
    if parentdir ~= nil then
        vim.cmd("cd " .. parentdir)
    end

    vim.cmd([[Telescope grep_string theme=dropdown]])
end

return M
