-- 
-- Following were installed in user dir
--   - pip3 install --user fortran-language-server
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
function _G.coc_on_tab(fwd)
    if fwd == 1 then    -- tab
        if vim.fn['coc#util#api_version']() < 31 then   -- old APIs
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
        else    -- new API from coc 0.0.82
            if vim.fn['coc#pum#visible']() == 1 then
                return vim.fn['coc#pum#next'](1)
            else
                -- TODO: enable snippet support
                if _G.coc_check_back_space() then
                    return myterminfo('<TAB>')
                else
                    return vim.fn['coc#refresh']()
                end
            end
        end
    else    -- Shift-tab
        if vim.fn['coc#util#api_version']() < 31 then   -- old APIs
            return vim.fn['coc#refresh']()              -- do nothing?
        else    -- new API from coc 0.0.82
            if vim.fn['coc#pum#visible']() == 1 then
                return vim.fn['coc#pum#prev'](1)
            else
                return myterminfo('<C-h>')
            end
        end
    end
end

------------- End  Functions for coc.nvim ---------------------------

-------------     Settings for coc.nvim -----------------------------
-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_autocmd("CursorHold",
                            {pattern="*",
                             command="silent call CocActionAsync('highlight')"}
)

-- Use K to show documentation in preview window.
vim.keymap.set("n", "K", "<cmd>silent call CocActionAsync('definitionHover')<CR>",
    {}
)

-- Set the function for <TAB>
vim.api.nvim_set_keymap("i", "<TAB>",
    'v:lua.coc_on_tab(1)',
    {noremap = true, silent = true, expr = true}
)
vim.api.nvim_set_keymap("i", "<S-TAB>",
    'v:lua.coc_on_tab(0)',
    {noremap = true, silent = false, expr = true}
)

------------- End Settings for coc.nvim -----------------------------
--
--
---------------- END   coc.nvim configuration     -------------------
