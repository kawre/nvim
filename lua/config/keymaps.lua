local keymap = vim.keymap.set

vim.g.mapleader = " "
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)
keymap("n", "<C-w>", "<cmd>b #<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- clear highlights
keymap("n", "<leader>ch", "<cmd>nohlsearch<cr>", opts)

-- tab indentation
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- write
keymap("n", "<leader>w", "<cmd>w<cr>", opts)

-- lazy
keymap("n", "<leader>lo", "<cmd>Lazy<CR>", opts)
