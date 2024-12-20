local M = {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"plenary.nvim",
		"nvim-web-devicons",
	},
	event = "VeryLazy",
	cmd = "Neotree",
}

M.keys = {
	{ "<leader>e", "<cmd>Neotree left toggle<cr>", desc = "Toggle Neotree" },
}

M.init = function()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- vim.cmd([[hi link NeoTreeGitAdded String]])
end

M.opts = {
	window = {
		position = "left",
		width = 60,
	},
	default_component_configs = {
		indent = {
			indent_size = 3,
			-- highlight = "Comment",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "󰜌",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon",
		},
		modified = {
			symbol = "",
			highlight = "NeoTreeModified",
		},
		git_status = {
			symbols = {
				-- Change type
				added = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},
		-- indent = {
		-- 	indent_size = 1,
		-- 	padding = 0,
		-- 	indent_market = "",
		-- },
	},
	filesystem = {
		use_libuv_file_watcher = true,
		group_empty_dirs = true,
		follow_current_file = { enabled = true, leave_dirs_open = true },
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = false,
			hide_hidden = true, -- only works on Windows for hidden files/directories
			hide_by_name = {
				"node_modules",
			},
			hide_by_pattern = { -- uses glob style patterns
				--"*.meta",
				--"*/src/*/tsconfig.json",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				--".gitignored",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				--".DS_Store",
				--"thumbs.db"
			},
			never_show_by_pattern = { -- uses glob style patterns
				--".null-ls_*",
			},
		},
		hijack_netrw_behavior = "open_default",
	},
}

M.config = function(_, opts)
	local Snacks = require("snacks")
	local function on_move(data)
		Snacks.rename.on_rename_file(data.source, data.destination)
	end
	local events = require("neo-tree.events")
	opts.event_handlers = opts.event_handlers or {}
	vim.list_extend(opts.event_handlers, {
		{ event = events.FILE_MOVED, handler = on_move },
		{ event = events.FILE_RENAMED, handler = on_move },
	})
	require("neo-tree").setup(opts)
end

return M
