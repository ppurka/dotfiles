local M = {}
local getdir = require("mine.individual.getdir")

M = function()
    if vim.o.spell then
        vim.api.nvim_feedkeys("]s", "n", false)
    else
        local parentdir = getdir({".git", "tags"})
        if parentdir ~= nil then
            vim.cmd("cd " .. parentdir)
        end

        vim.cmd([[Telescope grep_string word_match=-w theme=dropdown]])
    end
end

return M
