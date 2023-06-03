-- monospace fonts are controlled via ~/.config/fontconfig/conf.d/01-fonts.conf
-- Set default and custom fonts sizes.
-- The font is always monospace
-- 1.  0:   default font size
-- 2. -1:   decrease font size
-- 3.  1:   increase font size
-- 4.  2:   reset to default if custom_font is not set

local getglobal = require("mine.individual.getglobal")

local M = function(arg)
    -- reset arg to 0 if 2 is passed
    arg = (vim.g.custom_font == 0 and arg == 2) and 0 or arg

    -- return early if arg is not one of the expected values
    local goodarg = (arg == -1 or arg == 0 or arg == 1)
    if not goodarg then
        return
    end


    local gui_font_size = vim.g.gui_font_size
    if arg == 0 then                                            -- default font setting
        if (not vim.g.is_laptop         or
            vim.g.username_uid == nil   or
            vim.g.username_uid == 0) then
            gui_font_size = 14                                  -- font for gui windows
        else
            vim.g.only_laptop = getglobal("only_laptop")
            gui_font_size     = (vim.g.only_laptop and 14 or 16) -- small @ laptop
        end
        vim.g.custom_font = 0
    elseif arg == -1 then                                       -- decrease font size
        gui_font_size     = math.max(6, gui_font_size - 1)      -- min is 6
        vim.g.custom_font = 1
    elseif arg == 1 then                                        -- increase font size
        gui_font_size     = gui_font_size + 1
        vim.g.custom_font = 1
    end

    -- this is safe to do because vim.g.gui_font_size is set to a default value
    -- in settings.lua
    local to_font = "monospace:h" .. tostring(gui_font_size)
    local guifont = vim.api.nvim_get_option("guifont")
    local setfont = vim.g.custom_font == 1 or to_font ~= guifont
    if setfont then
        vim.opt.guifont     = to_font
        vim.g.gui_font_size = gui_font_size
    end
end -- end function

return M
