-- Some global variables
local getglobal = require("mine.individual.getglobal")
local day       = not getglobal("night_time")
local islpt     = getglobal("is_laptop")
local isterm    = getglobal("is_term")
local onlylptp  = getglobal("only_laptop")
local uid       = getglobal("username_uid")

-- Settings set via "set" in vimscript
local home      = os.getenv("HOME")
local vo        = vim.opt                                   -- shortcut for settings below
vo.autochdir    = true                                      -- Auto cd to current buffer, no need with telescope
vo.autoread     = true                                      -- Monitor file changes
vo.background   = (day and not isterm) and "light" or "dark"-- default dark/light BG
vo.clipboard    = "unnamed,unnamedplus"                     -- Copy / Paste from both secondary,primary registers
vo.expandtab    = true                                      -- No tab characters allowed
vo.foldenable   = false                                     -- do not fold by default
vo.foldexpr     = "nvim_treesitter#foldexpr()"              -- use nvim_treesitter to figure out expression
vo.foldmethod   = "expr"                                    -- expression determines fold
vo.formatoptions= "tcroq1nj"                                -- format options for all cases
vo.ignorecase   = true                                      -- case insensitive search
vo.modeline     = true                                      -- Read modeline from file
vo.mouse        = "a"                                       -- Good mouse behavior
vo.mousemodel   = "popup_setpos"                            -- move cursor to mouse position
vo.number       = true                                      -- Show line numbers
vo.shiftwidth   = 4                                         -- Spaces used for autoindent
vo.showcmd      = true                                      -- Show us the command we're typing
vo.showmatch    = true                                      -- Useful search functionality
vo.signcolumn   = "number"                                  -- merge signcolumn (diagnostics) and number
vo.smartcase    = true                                      -- ignorecase becomes sensitive when upper case is used
vo.smartindent  = true                                      -- indentation when starting a new line
vo.softtabstop  = 4                                         -- number of spaces inserted when <tab> is pressed
vo.suffixes:append(".pdf,.ps,.jpeg,.mov,.mpeg,.wav,.dia")   -- ignore these file extensions when matching filenames
vo.suffixes:append(".fig,.a,.o")
vo.tabstop      = 4                                         -- number of spaces shown for tab character
vo.termguicolors= true                                      -- 24-bit colors in terminal
vo.textwidth    = 80                                        -- max line length before wrapping
vo.title        = true                                      -- Set window title to filename
vo.undodir      = home .. "/.local/share/nvim/undo"         -- undo
vo.undofile     = true                                      -- Persistent undo. Stored in ~/.local/share/nvim/undo
vo.wildmode     = "longest:full,full"                       -- Provide a nice menu before the completion of commands
vo.wildignore:append('*.pdf,*.o,*.a,*.zip,*.tar,*.pyc')     -- ignore files
vo.wildignore:append('*.xz,*.gif,*.png,*.jpeg,*.jpg,*.PNG') -- ignore files
vo.wildignore:append('*.JPG,*.JPEG,*.chm,*.mov,*.mp3,*.wav')-- ignore files
vo.wildignore:append('*.flac,*.ogg,*.mpc,*.avi,*.mp4')      -- ignore files
vo.wildignore:append('*.bz2,*.mpeg')                        -- ignore files
vo.wildignore:append('*/.git/*,*/.hg/*,*/.svn/*,*/.cvs/*')  -- ignore dirs

-- some settings based on host names
if islpt then
    if uid == nil then
        vo.backupdir = home .. "/tmp"                       -- Backup files
        vo.directory = home .. "/tmp,."                     -- Swap dir
    else
        vo.backupdir = "/tmp/" .. uid .. ".browsercaches"   -- Backup files - prefer ram mounted /tmp
        vo.directory = "/tmp/" .. uid .. ".browsercaches,/tmp,."-- Swap dir - prefer ram mounted /tmp
    end
else
    vo.backupdir = home .. "/tmp"                           -- Backup files
    vo.directory = home .. "/tmp,."                         -- Swap dir
end

-- settings set via "let" in vimscript
-- buffer variables
vim.b.fortran_free_source   = 1                             -- This line *must* be present before 'syntax on'
vim.b.fortran_do_enddo      = 1                             -- Indent do-endo keywords
-- global variables
vim.g.do_filetype_lua       = 1                             -- use the new filetype.lua method in neovim-0.7
vim.g.did_load_filetypes    = 0                             -- disable use of filetype.vim
vim.g.loaded_python_provider= 0                             -- No python2
vim.g.loaded_ruby_provider  = 0                             -- No Ruby
vim.g.loaded_perl_provider  = 0                             -- No Perl

-- set the custom global variables
vim.g.custom_font           = 0                             -- whether we have set a custom font
vim.g.gui_font_size         = 11                            -- sane default font size
vim.g.is_laptop             = islpt                         -- save islpt as a global variable
vim.g.is_term               = isterm                        -- save whether we are running in terminal
vim.g.night_time            = not day                       -- check if it is night time
vim.g.only_laptop           = onlylptp                      -- true if only one display (laptop) is connected.
vim.g.username_uid          = uid                           -- save uid  as a global variable

if islpt then
    vim.g.node_host_prog    = home .. "/Documents/Installations/nodejs/node_modules/.bin/neovim-node-host"
    vim.g.python3_host_prog = "/usr/bin/python3"
else
    vim.g.node_host_prog        = home .. "/Installations/node-v14.17.5-linux-x64/bin/neovim-node-host"
    vim.g.python3_host_prog     = home .. '/Installations/python3.6.db9/bin/python3'
end
