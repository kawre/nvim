local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
		"ThePrimeagen/harpoon",
	},
	lazy = false,
}

M.keys = {
	{ "<leader>ff", ":Telescope find_files<CR>", desc = "Find File" },
	{ "<leader>ft", ":Telescope live_grep<CR>", desc = "Find Text" },
	{ "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffer" },
	{ "<leader>fk", ":Telescope keymaps<CR>", desc = "Find Keymap" },
	{ "<leader>fp", ":Telescope project<CR>", desc = "Find Project" },
}

M.config = function()
	local telescope = require("telescope")
	require("telescope").load_extension("project")

	local actions = require("telescope.actions")
	local project_actions = require("telescope._extensions.project.actions")

	telescope.setup({
		defaults = {
			prompt_prefix = "  ",
			selection_caret = "󱞪 ",
			path_display = { "smart" },
			file_ignore_patterns = {
				".git/",
				"node_modules",
			},
		},
		sync_with_nvim_tree = true,
		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
		extensions = {
			project = {
				base_dirs = { "~/projects" },
				-- on_project_selected = function(prompt_bufnr)
				-- 	project_actions.change_working_directory(prompt_bufnr, false)
				-- 	require("harpoon.ui").nav_file(1)
				-- end,
			},
		},
	})
end

return M
