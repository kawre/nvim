local M = {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
}

M.opts = {
	symbols = {
		modified = _G.symbols.modified,
		ellipsis = _G.symbols.ellipsis,
		separator = _G.symbols.separator,
	},
	kinds = _G.kinds,
}

return M
