
-- Autocommands

-- lua functions for settings stuff
local setc      = function() vim.opt.filetype = "c"                             end
local setcuda   = function() vim.opt.filetype = "cuda"                          end
local setfor    = function() vim.opt.filetype = "fortran"                       end
local setmake   = function() vim.opt.filetype = "make"                          end
local settext   = function() vim.opt.filetype = "text"                          end
local printwarn = function() vim.notify("File changed on disk. Buffer reloaded.",
                                        vim.log.levels.WARN)
                  end

local aucmd     = vim.api.nvim_create_autocmd
local bufs      = {"BufReadPost", "BufNewFile"}

-- new lua based autocommands
aucmd(bufs,                     {pattern="*.ci",                callback = setc})
aucmd(bufs,                     {pattern={"*.cu","*.cuh"},      callback = setcuda})
aucmd(bufs,                     {pattern="*.fi",                callback = setfor})
aucmd(bufs,                     {pattern="*.js",                command  = "set textwidth=0"})
aucmd(bufs,                     {pattern="vMakefile.include",   callback = setmake})
aucmd(bufs,                     {pattern={"*_mod"},             callback = settext})
aucmd("FileChangedShellPost",   {pattern = "*",                 callback = printwarn})
aucmd("FileType",               {pattern="make",                command = "set ts=8 sw=8 sts=8 noet"})
aucmd({"FocusGained", "BufEnter", "CursorHold", "CursorHoldI"},
                                {pattern = "*",                 command = "checktime"})

-- old stuff -- using vimscript
--vim.cmd([[
--    autocmd BufReadPost,BufNewFile  *                   set     formatoptions=tcroq1nj
--    autocmd BufReadPost,BufNewFile  *.ci                set     filetype=c
--    autocmd BufReadPost,BufNewFile  *.cu                set     filetype=cuda
--    autocmd BufReadPost,BufNewFile  *.cu                set     filetype=cuda
--    autocmd BufReadPost,BufNewFile  *.cuh               set     filetype=cuda
--    autocmd BufReadPost,BufNewFile  *.fi                set     filetype=fortran
--    autocmd BufReadPost,BufNewFile  *.js                set     textwidth=0
--    autocmd BufReadPost,BufNewFile  vMakefile.include   set     filetype=make
--    autocmd BufReadPost,BufNewFile  tango3_mod          set     filetype=text
--    autocmd BufReadPost,BufNewFile  g2_mod              set     filetype=text
--    autocmd FileType                make                set     ts=8 sw=8 sts=8 noet
--    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
--            \                                           checktime
--    autocmd FileChangedShellPost    *
--            \                                           echohl WarningMsg |
--            \                                           echo "File changed on disk. Buffer reloaded." | echohl None
--]])
