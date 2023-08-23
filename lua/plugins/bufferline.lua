local M = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
}

M.opts = {
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		diagnostics = "nvim_lsp",
		-- offsets = {
		-- 	{
		-- 		filetype = "neo-tree",
		-- 		text = "Neo-tree",
		-- 		highlight = "Directory",
		-- 		text_align = "left",
		-- 	},
		-- },
	},
}

return M
