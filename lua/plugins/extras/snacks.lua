---@module 'snacks'

local M = {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	-- dev = true,
}

M.opts = {
	bigfile = { enabled = true },
	notifier = {
		-- enabled = false,
		-- style = "fancy",
	},
	quickfile = { enabled = true },
	statuscolumn = {
		enabled = true,
		left = { "mark", "git" },
		right = { "fold", "sign" },
		folds = {
			open = true,
			git_hl = false,
		},
	},
	words = { enabled = true },
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
