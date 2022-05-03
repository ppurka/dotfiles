-- local functions
-- use function instead of os.execute. neovide tends to hang on os.execute
local function exec(cmd)
    local fh = assert(io.popen(cmd))
    local output = fh:read('*a')
    fh:close()
    return output
end

-- Settings set via "set" in vimscript
local home = os.getenv("HOME")
local stat = tonumber(exec("hostname -d | grep -c localdomain"))
local vo   = vim.opt                                        -- shortcut for settings below
vo.autochdir    = true                                      -- Auto cd to current buffer, no need with telescope
vo.autoread     = true                                      -- Monitor file changes
vo.background   = "dark"                                    -- dark/light BG
vo.clipboard    = "unnamed,unnamedplus"                     -- Copy / Paste from both secondary,primary registers
vo.expandtab    = true                                      -- No tab characters allowed
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
vo.wildmode     = "full"                                    -- Provide a nice menu before the completion of commands
vo.wildignore:append('*.pdf,*.o,*.a,*.zip,*.tar,*.pyc')     -- ignore files
vo.wildignore:append('*.xz,*.gif,*.png,*.jpeg,*.jpg,*.PNG') -- ignore files
vo.wildignore:append('*.JPG,*.JPEG,*.chm,*.mov,*.mp3,*.wav')-- ignore files
vo.wildignore:append('*.flac,*.ogg,*.mpc,*.avi,*.mp4')      -- ignore files
vo.wildignore:append('*.bz2,*.mpeg')                        -- ignore files
vo.wildignore:append('*/.git/*,*/.hg/*,*/.svn/*,*/.cvs/*')  -- ignore dirs

-- disabled for now
--vo.viminfo:prepend('!')                                     -- Save and restore global variables

-- some settings based on host names
if stat == 1 then
    local uid = tonumber(exec("echo $UID"))                 -- os.getenv("UID") returns nil
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
vim.g.hostname_stat         = stat                          -- save stat as a global variable

if stat == 1 then
    vim.g.node_host_prog    = home .. "/Documents/Installations/nodejs/node_modules/.bin/neovim-node-host"
    vim.g.python3_host_prog = "/usr/bin/python3"
    vim.cmd([[ colorscheme melange ]])
else
    vim.g.node_host_prog        = home .. "/Installations/node-v14.17.5-linux-x64/bin/neovim-node-host"
    vim.g.python3_host_prog     = home .. '/Installations/python3.6.db9/bin/python3'
    vim.cmd([[ colorscheme molokai ]])
end

-- Colorscheme
