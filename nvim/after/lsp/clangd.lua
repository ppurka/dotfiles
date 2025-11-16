-- specific lsp configurations
vim.lsp.config("clangd", {
    cmd = {"clangd", "--background-index", "--clang-tidy"},
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac', -- AutoTools
        -- '.git',      -- disable git. Depend on compile_commands.json
    },
})
