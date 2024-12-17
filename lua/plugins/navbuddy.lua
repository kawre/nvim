local M = {
	"SmiteshP/nvim-navbuddy",
	dependencies = "nvim-navic",
	-- event = "VeryLazy",
	-- enabled = vim.fn.has("nvim-0.10.0") == 1,
	-- enabled = false,
}

M.keys = {
	{ "<leader>s", "<cmd>Navbuddy<cr>", "Show file scope" },
}

M.opts = {
	lsp = {
		auto_attach = true,
	},
	window = {
		size = { height = "80%", width = "80%" },
	},
}

return M
