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
keymap("n", "<A-j>",     "<Esc>:m .+1<CR>==gi",         opts)   -- move text up
keymap("n", "<A-k>",     "<Esc>:m .-2<CR>==gi",         opts)   -- move text down
keymap("n", "<C-D>",     "<C-X>",                       opts)   -- decrement number
keymap("n", "<C-s>",     ":w<CR>",                      opts)   -- save file
keymap("n", "<C-Up>",    ":resize -2<CR>",              opts)   -- resize with arrows
keymap("n", "<C-Down>",  ":resize +2<CR>",              opts)   -- resize with arrows
keymap("n", "<C-Left>",  ":vertical resize -2<CR>",     opts)   -- resize with arrows
keymap("n", "<C-Right>", ":vertical resize +2<CR>",     opts)   -- resize with arrows
keymap("n", "<F2>",      ":lua require'mine.individual.myfind'.myfind_files()<CR>", opts) -- look for files
keymap("n", "<F3>",      ":Telescope grep_string theme=dropdown<CR>", opts) -- search all files
keymap("n", "<F4>",      ":Vista!!<CR>",                opts)   -- toggle tag bar
keymap("n", "<F5>",      ":e!<CR>",                     opts)   -- reload file
keymap("n", "<F9>",      ":set ft=valgrind nowrap<CR>", opts)   -- some custom settings
keymap("n", "<S-Left>",  "gT",                          opts)   -- previous tab
keymap("n", "<S-Right>", "gt",                          opts)   -- next tab
--keymap("n", "<C-I>",     "<C-A>",                       opts)   -- increment number


----------------------- INSERT MODE -------------------------
keymap("i", "<F2>",      "<Esc>:lua require'mine.individual.myfind'.myfind_files()<CR>", opts)
keymap("i", "<F3>",      "<Esc>:Telescope grep_string theme=dropdown<CR>", opts)
keymap("i", "<F4>",      "<Esc>:Vista!!<CR>a",          opts)
keymap("i", "<C-a>",     "<Home>",                      opts)
keymap("i", "<C-e>",     "<End>",                       opts)
keymap("i", "<C-h>",     "<Left>",                      opts)
keymap("i", "<C-j>",     "<Down>",                      opts)
keymap("i", "<C-k>",     "<Up>",                        opts)
keymap("i", "<C-l>",     "<Right>",                     opts)
keymap("i", "<C-s>",     "<Esc>:w<CR>a",                opts)
keymap("i", "<S-Left>",  "<Esc>gTa",                    opts)
keymap("i", "<S-Right>", "<Esc>gta",                    opts)


----------------------- VISUAL MODE -------------------------
keymap("v", "<LeftRelease>", '"*y',                     opts)   -- copy highlighted text to clipboard
keymap("v", "<A-j>",         ":m .+1<CR>==",            opts)   -- move text up
keymap("v", "<A-k>",         ":m .-2<CR>==",            opts)   -- move text down


---------------------- VISUAL BLOCK MODE -------------------
keymap("x", "<A-j>",      ":move '>+1<CR>gv-gv",        opts)   -- move text up
keymap("x", "<A-k>",      ":move '<-2<CR>gv-gv",        opts)   -- move text down
