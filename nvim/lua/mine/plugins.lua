-- see internetz for vim-plug and lua
--
local Plug = vim.fn['plug#']
vim.fn['plug#begin']('~/.config/nvim/plugged')

Plug('iamcco/markdown-preview.nvim', {              -- markdown preview
   ['do'] = function()
       vim.cmd([[mkdp#util#install()]])
   end,
   ['for'] = {'markdown', 'vim-plug'}
   }
)
Plug 'inkarkat/vim-ingo-library'                    -- Needed by vim-mark
Plug 'inkarkat/vim-mark'                            -- Multiple colors
Plug 'lewis6991/impatient.nvim'                     -- Cache lua based plugins to improve startup
Plug 'liuchengxu/vista.vim'                         -- Tagbar
Plug 'kyazdani42/nvim-web-devicons'                 -- for lualine
Plug 'lukas-reineke/indent-blankline.nvim'          -- for showing current indent
Plug('neoclide/coc.nvim', {branch = 'release'})     -- coc.nvim; ~/.config/coc
Plug 'nvim-lualine/lualine.nvim'                    -- statusline
Plug 'nvim-lua/plenary.nvim'                        -- needed by telescope
Plug 'nvim-telescope/telescope.nvim'                -- telescope
Plug('nvim-treesitter/nvim-treesitter', {           -- needed by neogen
    ['do'] = function()
        vim.cmd([[TSUpdate]])
    end
})
Plug 'savq/melange'                                 -- Colorscheme
Plug 'vim-scripts/auto-pairs-gentle'                -- need extra config
vim.fn['plug#end']()

---------------- START auto-pairs-gentle config   ------------------
vim.g.AutoPairsUseInsertedCount = 1
----------------  END  auto-pairs-gentle config   ------------------

---------------- START impatient   configuration  ------------------
require('impatient')
---------------- END   impatient   configuration  ------------------

---------------- START lualine     configuration  ------------------
require('lualine').setup({
   options = { theme = 'gruvbox', icons_enabled = true }
   })
---------------- END   lualine     configuration  ------------------

---------------- START indent-bl.. configuration  ------------------
require('indent_blankline').setup({
    --show_current_context = true,
    --show_current_context_start = true,
    use_treesitter = true,
    use_treesitter_scope = true,
   })
---------------- END   indent-bl.. configuration  ------------------

---------------- START nvim.lsp configuration     ------------------
-- This is internal nvim lsp configuration.
-- Prevent lsp from running in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,{ update_in_insert = false })
----------------  END  nvim.lsp configuration     ------------------


---------------- START vim-mark    configuration  ------------------
-- Use extended color palette and redefine yellow
vim.g.mwDefaultHighlightingPalette = 'extended'
vim.cmd([[highlight MarkWord4 ctermbg=16 ctermfg=Black guibg=#00FFFF guifg=Black]])
----------------  END  vim-mark    configuration  ------------------



