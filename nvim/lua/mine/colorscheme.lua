-- set colorscheme (same everywhere)
-- include after loading plugins
if vim.g.is_laptop and vim.g.username_uid == 0 then         -- root @ laptop
    vim.cmd([[colorscheme torte]])                          -- starkly differentiate root editor
                                                            -- second differentiation comes from font
else
    vim.cmd([[colorscheme melange]])
end

-- Set menu highlight for coc.nvim. Link it to usual menu selection
vim.cmd[[highlight! link CocMenuSel PmenuSel]]
