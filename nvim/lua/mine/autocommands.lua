-- Autocommands
local getglobal = require("mine.individual.getglobal")
local myfonts   = require("mine.individual.myfonts")

-- lua functions for settings stuff
local printwarn = function() vim.notify("File changed on disk. Buffer reloaded.",
                                        vim.log.levels.WARN)
                  end
local setbg     = function()
                    -- First set background
                    local bgprev = vim.api.nvim_get_option("background")
                    vim.g.night_time = getglobal("night_time")
                    if (vim.g.night_time  and bgprev ~= "dark") then
                        vim.opt.background = "dark"
                    elseif ((not vim.g.night_time)  and
                            (not vim.g.is_term)     and
                            bgprev ~= "light") then
                        vim.opt.background = "light"
                    end
                    if (bgprev ~= vim.opt.background) then
                        require('lualine').setup({              -- reload lualine
                            options = { theme = 'gruvbox', icons_enabled = true }
                        })
	                end

                    -- Next, set font
                    if (vim.g.is_laptop) then
                        myfonts(2)
                    end
                  end
local setc      = function() vim.opt.filetype = "c"                             end
local setcuda   = function() vim.opt.filetype = "cuda"                          end
local setfor    = function() vim.opt.filetype = "fortran"                       end
local setjs     = function() vim.o.textwidth  = 0
                             if not vim.g.is_laptop then
                                vim.b.coc_diagnostic_disable = 1
                             end
                  end
local settext   = function() vim.opt.filetype = "text"                          end
local set8      = function()
                    vim.opt.tabstop     = 8
                    vim.opt.shiftwidth  = 8
                    vim.opt.softtabstop = 8
                    vim.opt.expandtab   = false
                  end
local setmake   = function()
                    vim.opt.filetype = "make"
                    set8()
                  end

local aucmd     = vim.api.nvim_create_autocmd
local bufs      = {"BufReadPost", "BufNewFile"}

-- new lua based autocommands
aucmd(bufs,                     {pattern="*.ci",                callback = setc})
aucmd(bufs,                     {pattern={"*.cu*","*.hiph"},    callback = setcuda})
aucmd(bufs,                     {pattern="*.fi",                callback = setfor})
aucmd(bufs,                     {pattern="vMakefile.include*",  callback = setmake})
aucmd(bufs,                     {pattern="*_mod",               callback = settext})
aucmd("BufReadPre",             {pattern="*.js",                callback = setjs})
aucmd("FileChangedShellPost",   {pattern = "*",                 callback = printwarn})
aucmd("FileType",               {pattern="make",                callback = set8})
aucmd({"FocusGained", "BufEnter", "CursorHold", "CursorHoldI"},
                                {pattern = "*",                 command  = "checktime"})
aucmd("FocusGained",            {pattern = "*",                 callback = setbg})
aucmd("VimEnter",               {pattern = "*",                 command  = "IBLDisable"})
