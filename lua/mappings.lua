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
-- Better window/buffer navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-n>", ":bnext <CR>", opts)
keymap("n", "<C-p>", ":bprev <CR>", opts)
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1 <CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2 <CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3 <CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4 <CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5 <CR>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6 <CR>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7 <CR>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8 <CR>", opts)
keymap("n", "<leader>9", ":BufferLineGoToBuffer 9 <CR>", opts)
keymap("n", "<leader>bp", ":BufferLinePick <CR>", opts)
keymap("n", "<leader>q", ":bd <CR> | :bnext <CR>", opts)

-- Move single line around
keymap("n", "<A-j>", ":m .+1<CR>", opts)
keymap("n", "<A-k>", ":m .-2<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>fif", ":Telescope current_buffer_fuzzy_find <CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers <CR>", opts)

-- Nvim-Tree
keymap("n", "<leader>e", ":NvimTreeToggle <CR>", opts)
-- H to toggle hidden files
-- E to expand entire file tree
-- W to collapse entire file tree
-- <C-k> to display file info

-- Git
keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame  <CR>", opts)
keymap("n", "<leader>gd", ":Gitsigns diffthis  <CR>", opts)

-- Reindent entire file but keep cursor where it was
keymap("n", "<leader>i", "gg=G''", opts)

-- Press jk fast to go to Normal mode
keymap("i", "jk", "<ESC>", opts)

-- Reload config
keymap("n", "<leader>sv" , ":source $MYVIMRC <CR>", opts)
keymap("n", "<leader>scf" , ":source % <CR>| :echo \"sourced file\" <CR>", opts)
keymap("n", "<leader><leader>x" , ":source % <CR>| :echo \"sourced file\" <CR>", opts)

