-- cscope bindings
--
local getdir = require("mine.individual.getdir")
local setcscopefile = function()
                        local dir = getdir("cscope.out")
                        if dir ~= nil then
                            vim.cmd("cs add " .. dir .. "/" .. "cscope.out " .. -- cscope file
                                    dir ..                                      -- cscope pre-path
                                    " -d")                                      -- do not update cscope
                        end
                      end


if vim.fn.has("cscope") then
    vim.opt.cscopetag       = true          -- use both cscope and ctags
    vim.opt.csto            = 0             -- check cscope before ctags
    vim.opt.cscopeverbose   = false         -- hide message when adding cscope db

    vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"},
                                {pattern = "*", callback = setcscopefile})
    
    -- now set keybindings
    local vks = vim.keymap.set
    local cf  = ":cs find "
    local cr  = " " .. myterminfo'<C-r>' .. "=expand('<cword>')" ..
                myterminfo'<CR>' .. myterminfo'<CR>'
    local cF  = " " .. myterminfo'<C-r>' .. "=expand('<cfile>')" ..
                myterminfo'<CR>' .. myterminfo'<CR>'
    local opt = {noremap = true, silent = true}

    vks("n", "<C-\\>a", cf .. "a" .. cr, opt)   -- places where symbol is assigned a value
    vks("n", "<C-\\>c", cf .. "c" .. cr, opt)   -- calls
    vks("n", "<C-\\>d", cf .. "d" .. cr, opt)   -- functions called in current function
    vks("n", "<C-\\>f", cf .. "f" .. cF, opt)   -- open file under cursor
    vks("n", "<C-\\>g", cf .. "g" .. cr, opt)   -- global definition of current symbol
    vks("n", "<C-\\>s", cf .. "s" .. cr, opt)   -- symbol
end
