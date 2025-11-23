-- override the command
local filepath = os.getenv("HOME") .. "~/.config/nvim/after/lsp/fortls.json"
vim.lsp.config("fortls", {
    cmd = {
        "fortls",
        "--config", filepath,
        "--disable_autoupdate",
        "--hover_signature",
        "--hover_language=fortran",
        "--use_signature_help",
    }
})
