local M = {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	enabled = false,
}

M.init = function()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

M.keys = {
	{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Nvim Tree Toggle" },
}

M.opts = {
	sort_by = "case_sensitive",
	view = {
		width = 60,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
}

return M
