-- GUI related commands

-- one function common to all GUI
-- fonts are controlled via ~/.config/fontconfig/conf.d/01-fonts.conf

local myfonts   = require("mine.individual.myfonts")

-- Following is for neovide
if vim.g.neovide then
    vim.g.neovide_cursor_animation_length   = 0.01              -- length of cursor animation in sec
    vim.g.neovide_floating_opacity          = 0.65              -- opacity of floating windows
    vim.g.neovide_floating_blur             = true              -- floating windows are blurred
end
myfonts(0)
