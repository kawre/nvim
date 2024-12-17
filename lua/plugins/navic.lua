local user = require("config.user")

local M = {
	"SmiteshP/nvim-navic",
	event = "VeryLazy",
	enabled = false,
}

M.opts = {
	icons = user.kinds,
	highlight = true,
	lsp = {
		auto_attach = true,
	},
	click = true,
	separator = user.symbols.separator,
	depth_limit = 0,
	depth_limit_indicator = user.symbols.ellipsis,
}

return M
