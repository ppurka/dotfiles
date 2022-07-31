local M = {}
M = function()
    if vim.o.spell then
        vim.api.nvim_feedkeys("[s", "n", false)
    else
        vim.cmd([[set ts=3 sts=3 sw=3 et]])
        vim.api.nvim_feedkeys("a", "n", false)
    end
end

return M
