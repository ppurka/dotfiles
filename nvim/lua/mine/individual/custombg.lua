-- toggle the background and set vim.g.custombg to true

local M = function()
    local bgprev = vim.api.nvim_get_option_value("background", {})
    vim.opt.background = (bgprev == "dark") and "light" or "dark"

    require('lualine').setup({              -- reload lualine
        options = { theme = 'gruvbox', icons_enabled = true }
    })

    vim.g.custombg = true
end -- end function

return M
