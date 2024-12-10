local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	enabled = false,
}

M.opts = {
	exclude = {
		buftypes = {
			"terminal",
			"nofile",
		},
		filetypes = {
			"help",
			"startify",
			"dashboard",
			"lazy",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"text",
			"leetcode.nvim",
		},
	},
	scope = {
		enabled = false,
	},
}

return M
