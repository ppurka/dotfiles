-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Initial variables
local keymap    = vim.api.nvim_set_keymap           -- short name
local opts      = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)


----------------------- NORMAL MODE -------------------------
keymap("n", "<C-F2>",    ":Telescope oldfiles  theme=dropdown<CR>",        opts) -- previously opened files
keymap("n", "<C-F3>",    ":Telescope live_grep theme=dropdown<CR>",        opts) -- search in currdir
keymap("n", "<C-F4>",    ":IBLToggle<CR>",                                 opts) -- toggle indent marker
keymap("n", "<C-F5>",    ":lua require('mine.individual.custombg')()<CR>", opts) -- toggle background
keymap("n", "<C-0>",     ":lua require('mine.individual.myfonts')(0)<CR>", opts) -- reset font
keymap("n", "<C-->",     ":lua require('mine.individual.myfonts')(-1)<CR>",opts) -- decrease font
keymap("n", "<C-=>",     ":lua require('mine.individual.myfonts')(1)<CR>", opts) -- increase font
keymap("n", "<S-F3>",    ":lua require('mine.individual.myspel')()<CR>",   opts) -- spell search or ts,sts
keymap("n", "<F2>",      ":lua require('mine.individual.myfind')()<CR>",   opts) -- look for files
keymap("n", "<F3>",      ":lua require('mine.individual.mygrep')()<CR>",   opts) -- search all files
keymap("n", "<F4>",      ":Vista!!<CR>",                        opts)   -- toggle tag bar
keymap("n", "<F5>",      ":e!<CR>",                             opts)   -- reload file
keymap("n", "<F9>",      ":set ft=valgrind nowrap<CR>",         opts)   -- some custom settings
keymap("n", "<A-j>",     "<Esc>:m .+1<CR>==gi",                 opts)   -- move text up
keymap("n", "<A-k>",     "<Esc>:m .-2<CR>==gi",                 opts)   -- move text down
keymap("n", "<C-D>",     "<C-X>",                               opts)   -- decrement number
keymap("n", "<C-s>",     ":w<CR>",                              opts)   -- save file
keymap("n", "<C-Up>",    ":resize -2<CR>",                      opts)   -- resize with arrows
keymap("n", "<C-Down>",  ":resize +2<CR>",                      opts)   -- resize with arrows
keymap("n", "<C-Left>",  ":vertical resize -2<CR>",             opts)   -- resize with arrows
keymap("n", "<C-Right>", ":vertical resize +2<CR>",             opts)   -- resize with arrows
keymap("n", "<S-F2>",    ":set ts=2 sts=2 sw=2 et<CR>",         opts)
keymap("n", "<S-F4>",    ":set ts=4 sts=4 sw=4 et<CR>",         opts)
keymap("n", "<S-F8>",    ":set ts=8 sts=8 sw=8<CR>",            opts)
keymap("n", "<S-Left>",  "gT",                                  opts)   -- previous tab
keymap("n", "<S-Right>", "gt",                                  opts)   -- next tab
--keymap("n", "<C-I>",     "<C-A>",                             opts)   -- increment number

if not vim.g.neovide then -- likely running nvim-qt
keymap("n", "<F1>",      ":GuiTreeviewToggle<CR>",              opts)   -- toggle QT file side bar
end

----------------------- INSERT MODE -------------------------
keymap("i", "<C-F2>",    "<Esc>:Telescope oldfiles  theme=dropdown<CR>",        opts) -- previously opened files
keymap("i", "<C-F3>",    "<Esc>:Telescope live_grep theme=dropdown<CR>",        opts) -- search in currdir
keymap("i", "<C-F4>",    "<Esc>:IBLToggle<CR>a",                                opts) -- toggle indent marker
keymap("i", "<C-F5>",    "<Esc>:lua require('mine.individual.custombg')()<CR>a",opts) -- toggle background
keymap("i", "<S-F3>",    "<Esc>:lua require('mine.individual.myspel')()<CR>a",  opts) -- rev spell search or ts,sts
keymap("i", "<F2>",      "<Esc>:lua require('mine.individual.myfind')()<CR>",   opts) -- look for files
keymap("i", "<F3>",      "<Esc>:lua require('mine.individual.mygrep')()<CR>",   opts) -- search all files
keymap("i", "<F4>",      "<Esc>:Vista!!<CR>",                   opts)
keymap("i", "<C-a>",     "<Home>",                              opts)
keymap("i", "<C-e>",     "<End>",                               opts)
keymap("i", "<C-h>",     "<Left>",                              opts)
keymap("i", "<C-j>",     "<Down>",                              opts)
keymap("i", "<C-k>",     "<Up>",                                opts)
keymap("i", "<C-l>",     "<Right>",                             opts)
keymap("i", "<C-s>",     "<Esc>:w<CR>a",                        opts)
keymap("i", "<S-F2>",    "<Esc>:set ts=2 sts=2 sw=2 et<CR>a",   opts)
keymap("i", "<S-F4>",    "<Esc>:set ts=4 sts=4 sw=4 et<CR>a",   opts)
keymap("i", "<S-F8>",    "<Esc>:set ts=8 sts=8 sw=8<CR>a",      opts)
keymap("i", "<S-Left>",  "<Esc>gTa",                            opts)
keymap("i", "<S-Right>", "<Esc>gta",                            opts)

if not vim.g.neovide then -- likely running nvim-qt
keymap("i", "<F1>",      "<Esc>:GuiTreeviewToggle<CR>a",        opts)   -- toggle QT file side bar
end


----------------------- VISUAL MODE -------------------------
keymap("v", "<LeftRelease>", '"*y',                             opts)   -- copy highlighted text to clipboard
keymap("v", "<A-j>",      ":m .+1<CR>==",                       opts)   -- move text up
keymap("v", "<A-k>",      ":m .-2<CR>==",                       opts)   -- move text down
keymap("v", "<A-Up>",     ":m .+1<CR>==",                       opts)   -- move text up
keymap("v", "<A-Down>",   ":m .-2<CR>==",                       opts)   -- move text down


---------------------- VISUAL BLOCK MODE -------------------
keymap("x", "<A-j>",      ":move '>+1<CR>gv-gv",                opts)   -- move text up
keymap("x", "<A-k>",      ":move '<-2<CR>gv-gv",                opts)   -- move text down
keymap("x", "<A-Up>",     ":move '>+1<CR>gv-gv",                opts)   -- move text up
keymap("x", "<A-Down>",   ":move '<-2<CR>gv-gv",                opts)   -- move text down
