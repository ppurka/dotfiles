-- see internetz for vim-plug and lua
--
local Plug = vim.fn['plug#']
-- vim.fn['plug#begin']('~/.config/nvim/plugged')
-- We need this approach to suppress any errors from loading plugins, or missing git.
vim.cmd([[silent! call plug#begin('~/.config/nvim/plugged')]])

Plug 'inkarkat/vim-ingo-library'                    -- Needed by vim-mark
Plug 'inkarkat/vim-mark'                            -- Multiple colors
Plug 'liuchengxu/vista.vim'                         -- Tagbar for functions, symbols, etc
Plug 'kyazdani42/nvim-web-devicons'                 -- for lualine, markdown, etc
Plug 'neovim/nvim-lspconfig'                        -- all the LSP server configs
Plug 'nvim-lualine/lualine.nvim'                    -- statusline
Plug 'nvim-lua/plenary.nvim'                        -- needed by telescope, codecompanion
Plug 'nvim-telescope/telescope.nvim'                -- telescope
Plug('nvim-treesitter/nvim-treesitter', {           --
    ['do'] = function()
        vim.cmd([[TSUpdate]])
    end
})
Plug 'MeanderingProgrammer/render-markdown.nvim'    -- Rendering markdown files
Plug 'olimorris/codecompanion.nvim'                 -- AI completion
Plug 'saghen/blink.cmp'                             -- for completion
Plug 'savq/melange'                                 -- Colorscheme
Plug 'vim-scripts/auto-pairs-gentle'                -- needs extra config
vim.fn['plug#end']()

-- Have not used these for a while.
--Plug 'lukas-reineke/indent-blankline.nvim'          -- for showing current indent

---------------- START auto-pairs-gentle config   ------------------
vim.g.AutoPairsUseInsertedCount = 1
----------------  END  auto-pairs-gentle config   ------------------

---------------- START blink.cmp   configuration  ------------------
require('blink.cmp').setup({
    completion  = { documentation   = { auto_show = true } },
    keymap      = { preset          = 'super-tab' },
    fuzzy       = { implementation  = 'lua' },
})
---------------- END   blink.cmp   configuration  ------------------

---------------- START indent-bl.. configuration  ------------------
-- Disable. Haven't used it for a while
-- require('ibl').setup({
--     --show_current_context = true,
--     --show_current_context_start = true,
--     -- use_treesitter = true,           -- ibl v2
--     -- use_treesitter_scope = true,     -- ibl v2
--     scope = { enabled = true },
--    })
---------------- END   indent-bl.. configuration  ------------------

---------------- START lualine     configuration  ------------------
if vim.g.have_git then
    require('lualine').setup({
       options = {
            theme = 'gruvbox',
            icons_enabled = true,
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
        }
    })
else
    require('lualine').setup({
       options  = {
            theme = 'gruvbox',
            icons_enabled = true,
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
        },
       sections = { lualine_b = {'diagnostics'} }
    })
end
---------------- END   lualine     configuration  ------------------

---------------- START render-markdown config     ------------------
require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})
----------------  END  render-markdown config     ------------------

---------------- START vim-mark    configuration  ------------------
-- Use extended color palette and redefine yellow
vim.g.mwDefaultHighlightingPalette = 'extended'
vim.cmd([[highlight MarkWord4 ctermbg=16 ctermfg=Black guibg=#00FFFF guifg=Black]])
----------------  END  vim-mark    configuration  ------------------
