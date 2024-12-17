local M = {
	"petertriho/nvim-scrollbar",
	event = "LazyFile",
}

M.opts = {
	excluded_buftypes = {
		"terminal",
	},
	excluded_filetypes = {
		"cmp_docs",
		"cmp_menu",
		"noice",
		"prompt",
		"TelescopePrompt",
		"neo-tree",
		"lazy",
		"leetcode.nvim",
		"blink-cmp-menu",
		"dapui_hover",
	},
}

return M
