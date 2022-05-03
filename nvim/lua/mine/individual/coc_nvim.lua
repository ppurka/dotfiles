-- 
-- Following were installed in user dir
--   - pip3 install --user fortran-language-server
--   - rust, maintained using rustup. Compiling rust takes too long. Hence,
--     system has only rust-bin package. Personal installation is in
--     ~/Documents/Installations/{cargo,rustup}
-- 
-- Following were installed in system
--   - clang
--   - rust
-- 
-- Packages installed using CocInstall are present in ~/.config/coc

---------------- START coc.nvim configuration     -------------------
-- coc.nvim has a lot of configuration
--
--

-----------------  Functions for coc.nvim ---------------------------
-- Function to take care of term codes - used in tab completion
function _G.myterminfo(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Check for backspace - used in tab completion
function _G.coc_check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

-- intelligent tab completion
function _G.coc_on_tab()
   if vim.fn.pumvisible() == 1 then
       return vim.fn['coc#_select_confirm']()
   else
       if vim.fn['coc#expandableOrJumpable']() == 1 then
           return myterminfo'<C-r>' ..
                  "=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])" ..
                  myterminfo'<CR>'
       else
           if _G.coc_check_back_space() then
               return myterminfo'<TAB>'
           else
               return vim.fn['coc#refresh']()
           end
       end
   end
end

---- Hover function definition when K is pressed over a function
--function _G.coc_show_documentation()
--    local go = vim.api.nvim_get_option
--    if (vim.bo.filetype == "vim" or vim.bo.filetype == "help") then
--        local mycmd = 'help ' .. vim.fn.expand('<cword>')
--        vim.api.nvim_exec(mycmd, true)
--    else
--        if vim.fn['coc#rpc#ready']() == 1 then
--            --vim.fn.CocActionAsync('doHover')
--            vim.cmd("call CocActionAsync('definitionHover')")
--        else
--            vim.cmd('! ' .. go("keywordprg") .. ' ' .. vim.fn.expand('<cword>'))
--        end
--    end
--end

------------- End  Functions for coc.nvim ---------------------------

-------------     Settings for coc.nvim -----------------------------
-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_autocmd("CursorHold",
                            {pattern="*",
                             command="silent call CocActionAsync('highlight')"}
)

-- Use K to show documentation in preview window.
--vim.api.nvim_set_keymap("n", "K", "v:lua.coc_show_documentation()",
--    {noremap = true, silent = true, expr = true}
--)
vim.keymap.set("n", "K", "<cmd>silent call CocActionAsync('definitionHover')<CR>",
    {}
)

-- Set the function for <TAB>
vim.api.nvim_set_keymap("i", "<TAB>",
    'v:lua.coc_on_tab()',
    {noremap = true, silent = true, expr = true}
)

------------- End Settings for coc.nvim -----------------------------
--
--
---------------- END   coc.nvim configuration     -------------------
