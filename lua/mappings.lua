local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Use space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move single line around
keymap("n", "<A-j>", ":m .+1<CR>", opts)
keymap("n", "<A-k>", ":m .-2<CR>", opts)

-- Telescope
keymap("n", "<leader>fb", ":Telescope file_browser <CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>fif", ":Telescope current_buffer_fuzzy_find <CR>", opts)

-- Neotree
keymap("n", "<leader>e", ":NeoTreeFocusToggle <CR>", opts)

-- Git
keymap("n", "<leader>gb", ":GitBlameToggle <CR>", opts)

-- Reindent entire file but keep cursor where it was
keymap("n", "<leader>i", "gg=G''", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

