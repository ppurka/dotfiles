-- function for auto-creating Github URL
local gh = function(_strlist)
            local output = {}
            for _i,_s in ipairs(_strlist) do
              output[_i] = "https://github.com/" .. _s
            end
            return output
           end

vim.pack.add(gh({
                "inkarkat/vim-ingo-library",                -- needed by vim-mark
                "inkarkat/vim-mark",                        -- Multiple colours
                "liuchengxu/vista.vim",                     -- Tagbar
                "kyazdani42/nvim-web-devicons",             -- for lualine, markdown, etc
                "neovim/nvim-lspconfig",                    -- all the LSP server configs
                "nvim-lualine/lualine.nvim",                -- statusline
                "nvim-lua/plenary.nvim",                    -- needed by telescope, codecompanion
                "nvim-telescope/telescope.nvim",            -- telescope
                "MeanderingProgrammer/render-markdown.nvim",-- Rendering markdown files
                "saghen/blink.lib",                         -- for completion
                "saghen/blink.cmp",                         -- for completion
                })
            )

-- locally managed plugins with my custom changes
vim.cmd.packadd("auto-pairs-gentle")                        -- needs extra config
vim.cmd.packadd("melange")                                  -- Colorscheme

---------------- START auto-pairs-gentle config   ------------------
vim.g.AutoPairsUseInsertedCount = 1
----------------  END  auto-pairs-gentle config   ------------------

---------------- START blink.cmp   configuration  ------------------
-- fuzzy search binary is in
-- ~/.config/nvim/plugged/blink.cmp/target/release/libblink_cmp_fuzzy.so
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
    completion  = { documentation   = { auto_show = true },
                    ghost_text      = { enabled   = true },
                  },
    fuzzy       = { implementation  = 'prefer_rust' },
    keymap      = { preset          = 'super-tab' },
    --selection   = { preselect       = false },
    signature   = { enabled         = true },
})
---------------- END   blink.cmp   configuration  ------------------

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
    file_types = { "markdown", "codecompanion" },
    completions = { lsp = { enabled = true } },
    opts = {
      render_modes = true,          -- render in all modes
      sign = { enabled = false },   -- turn off in the status column
    }
})
-- register `markdown` as a parser for `codecompanion` files
vim.treesitter.language.register("markdown", "codecompanion")

----------------  END  render-markdown config     ------------------

---------------- START vim-mark    configuration  ------------------
-- Use extended color palette and redefine yellow
vim.g.mwDefaultHighlightingPalette = 'extended'
vim.cmd([[highlight MarkWord4 ctermbg=16 ctermfg=Black guibg=#00FFFF guifg=Black]])
----------------  END  vim-mark    configuration  ------------------
