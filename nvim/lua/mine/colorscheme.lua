-- set colorscheme (same everywhere)
-- include after loading plugins
if vim.g.is_laptop and vim.g.username_uid == 0 then -- root @ laptop
    vim.g.the_cs = 'unokai'                         -- starkly differentiate root editor
                                                    -- second differentiation comes from font
else
    vim.g.the_cs = 'melange'
end
vim.cmd('colorscheme ' .. vim.g.the_cs)

-- Set menu highlight for coc.nvim. Link it to usual menu selection
vim.cmd[[highlight! link CocMenuSel PmenuSel]]
