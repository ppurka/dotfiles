-- Enable several lsp servers
-- Language server                      |   install method
vim.lsp.enable("clangd")                --  installed in the system
vim.lsp.enable("cmake")                 --  pip install cmake-language-server
vim.lsp.enable("fortls")                --  pip install fortls
vim.lsp.enable("lua_ls")                --  download x64 linux version from
                                        --  https://github.com/LuaLS/lua-language-server/releases/latest
                                        --  use shell script to exec full path; do not symlink
vim.lsp.enable("markdown_oxide")        --  download x64 linux version from
                                        --  https://github.com/Feel-ix-343/markdown-oxide/releases/latest
                                        --  symlink from binary dir
vim.lsp.enable("pyright")               --  cd $NPM_CONFIG_PREFIX/lib where node_modules is present
                                        --  npm install pyright
                                        --  add node_modules/.bin to PATH when starting vim
vim.lsp.enable("rust_analyzer")         --  installed in the system
vim.lsp.enable("yamlls")                --  cd $NPM_CONFIG_PREFIX/lib where node_modules is present
                                        --  npm install yaml-language-server
                                        --  add node_modules/.bin to PATH when starting vim
