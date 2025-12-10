-- diagnostic configurations

-- autocommand set in autocommands.lua

-- Prevent diagnostics from showing in insert mode
--vim.lsp.handlers["textDocument/publishDiagnostics"] =
--     vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
--                  { update_in_insert = false })

-- Styling of the floating window
vim.diagnostic.config({
    float = {
        focusable = false,
        title     = " LSP Diagnostics ",
        title_pos = "center",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN]  = '▲',
            [vim.diagnostic.severity.HINT]  = '⚑',
            [vim.diagnostic.severity.INFO]  = '»',
        },
    },
    update_in_insert = false,
})
