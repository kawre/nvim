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
		---@type string
		modified = _G.symbols.modified,

		---@type string
		ellipsis = _G.symbols.ellipsis,

		---@type string
		separator = _G.symbols.separator,
	},
	kinds = _G.kinds,
}

return M
