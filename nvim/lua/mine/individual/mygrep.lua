local getdir = require("mine.individual.getdir")

local M = function()
    if vim.o.spell then
        vim.api.nvim_feedkeys("]s", "n", false)
    else
        -- look for tags first. It may be at a parentdir of .git
        local parentdir = getdir({"tags", ".git"})
        if parentdir ~= nil then
            vim.cmd("cd " .. parentdir)
        end

        vim.cmd([[Telescope grep_string word_match=-w theme=dropdown]])
    end
end

return M
