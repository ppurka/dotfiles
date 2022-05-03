-- GUI related commands

-- one function common to all GUI
-- fonts are controlled via ~/.config/fontconfig/conf.d/01-fonts.conf
local function common()
    if vim.g.hostname_stat == 1 then
        vim.opt.background  = "light"                           -- light background in GUI
        vim.opt.guifont     = "monospace:h11"                   -- font for gui windows
    else
        vim.opt.background  = "dark"                            -- dark background in GUI
        vim.opt.guifont     = "monospace:h12"                   -- font for gui windows
    end
end


-- Following is for neovide
if vim.g.neovide then
    vim.g.neovide_cursor_animation_length   = 0.01              -- length of cursor animation in sec
    vim.g.neovide_floating_opacity          = 0.65              -- opacity of floating windows
    vim.g.neovide_floating_blur             = true              -- floating windows are blurred
    common()
end
