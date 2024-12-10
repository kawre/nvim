local user = require("config.user")

local M = {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	event = "VeryLazy",
	-- enabled = vim.fn.has("nvim-0.10") == 1,
	-- enabled = false,
}

M.opts = {
	bar = {
		update_debounce = 100,
		update_events = {
			win = {
				"CursorMoved",
				-- "CursorMovedI",
				"WinEnter",
				"WinResized",
			},
			buf = {
				"BufModifiedSet",
				"FileChangedShellPost",
				"TextChanged",
				-- "TextChangedI",
				-- "InsertLeave",
			},
		},
	},
	sources = {
		path = {
			modified = function(sym)
				return sym:merge({
					icon = user.symbols.modified .. " ",
					icon_hl = "Constant",
				})
			end,
		},
	},
	icons = {
		kinds = {
			symbols = vim.tbl_map(function(icon) --
				return icon .. " "
			end, user.kinds),
		},
		ui = {
			bar = {
				separator = " " .. user.symbols.separator .. " ",
				extends = user.symbols.ellipsis,
			},
		},
	},
}

return M
