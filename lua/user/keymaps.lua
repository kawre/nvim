-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- NvimTree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>p", ":Telescope find_files<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)
