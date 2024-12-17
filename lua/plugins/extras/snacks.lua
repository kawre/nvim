---@module 'snacks'

local signs = require("config.user").signs

local M = {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dev = true,
}

M.opts = {
	words = { enabled = true },
	bigfile = { enabled = true },
	notifier = {
		icons = {
			error = signs.error,
			warn = signs.warn,
			info = signs.info,
			debug = signs.debug,
			trace = signs.trace,
		},
		level = vim.log.levels.INFO,
	},
	quickfile = { enabled = true },
	statuscolumn = {
		enabled = true,
		left = { "sign", "git" },
		right = { "mark", "fold" },
		folds = {
			open = true,
			git_hl = false,
		},
	},
	styles = {
		notification = {
			wo = { wrap = true }, -- Wrap notifications
		},
		["notification.history"] = {
			width = 0.9,
			height = 0.8,
			minimal = true,
			keys = { q = "close", ["<esc>"] = "close" },
		},
	},
	dashboard = { enabled = false },
	indent = {
		indent = {
			enabled = true,
		},
		scope = {
			enabled = false,
			animate = {
				enabled = false,
			},
		},
	},
	scroll = {
		enabled = true,
	},
}

M.keys = {
	{
		"<leader>fn",
		function()
			Snacks.notifier.show_history()
		end,
		desc = "Notification History",
	},
	{
		"<leader>rf",
		function()
			Snacks.rename.rename_file()
		end,
		desc = "Notification History",
	},
}

return M
