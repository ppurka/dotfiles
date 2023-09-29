local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then return end

if vim.g.have_git then
    require("nvim-treesitter.install").prefer_git = true    -- use proxy from gitconfig

    configs.setup {
        ensure_installed = {
            "bash"
            , "c"
            , "cmake"
            , "comment"
            , "cpp"
            , "cuda"
            , "dockerfile"
            , "fortran"
            , "go"
            , "html"
            , "json"
            , "json5"
            , "julia"
            , "latex"
            , "lua"
            , "make"
            , "markdown"
            , "perl"
            , "python"
            , "r"
            , "regex"
            , "rst"
            , "rust"
            , "vim"
        },
        sync_install = false,   -- install languages synchronously
        highlight = {
            enable = true,
            disable = { "" },   -- list of languages to disable highlight
            additional_vim_regex_highlighting = true,
        },
        indent = {
            enable = true,
            disable = { "" },
        },
    }

else
    configs.setup {
        auto_install = false,   -- disable git lookup; which disables error messages from missing git
        sync_install = false,   -- install languages synchronously
        highlight = {
            enable = true,
            disable = { "" },   -- list of languages to disable highlight
            additional_vim_regex_highlighting = true,
        },
        indent = {
            enable = true,
            disable = { "" },
        },
    }

end
