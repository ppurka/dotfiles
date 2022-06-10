-- GUI related commands

-- one function common to all GUI
-- fonts are controlled via ~/.config/fontconfig/conf.d/01-fonts.conf
local function common()
    if (not vim.g.is_laptop         or
        vim.g.username_uid == nil   or
        vim.g.username_uid == 0) then
        -- vim.opt.background  = "dark"                         -- dark background in GUI
        vim.opt.guifont     = "monospace:h12"                   -- font for gui windows
    else
        vim.opt.guifont = "monospace:h" ..
                          (vim.g.only_laptop and "8" or "11")   -- small @ laptop
        -- vim.opt.background = "light"                         -- controlled via aucmd now
    end
end


-- Following is for neovide
if vim.g.neovide then
    vim.g.neovide_cursor_animation_length   = 0.01              -- length of cursor animation in sec
    vim.g.neovide_floating_opacity          = 0.65              -- opacity of floating windows
    vim.g.neovide_floating_blur             = true              -- floating windows are blurred
    common()
end
