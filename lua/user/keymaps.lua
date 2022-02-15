local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- telescope
keymap(
	"n",
	"<C-P>",
	":lua require'telescope.builtin'.git_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)

-- Elo
keymap("n", "\\", ":NvimTreeToggle<CR>", opts)
keymap("n", "gq", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)

-- Insert
keymap("i", "jk", "<Esc>", opts)

-- Buffer
keymap("n", "<leader>p", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>n", ":BufferLineCyclePrev<CR>", opts)
