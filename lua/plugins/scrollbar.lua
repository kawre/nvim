local M = {
	"petertriho/nvim-scrollbar",
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
		"Telescope",
	},
}

return M
