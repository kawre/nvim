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
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
	{ "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffer" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymap" },
	{ "<leader>fp", "<cmd>Telescope project<CR>", desc = "Find Project" },
	{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Tags" },
}

M.config = function()
	local telescope = require("telescope")
	require("telescope").load_extension("project")
	local actions = require("telescope.actions")

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
		-- mappings = {
		-- 	i = {
		-- 		["<Down>"] = actions.cycle_history_next,
		-- 		["<Up>"] = actions.cycle_history_prev,
		-- 		["<C-k>"] = actions.cycle_history_prev,
		-- 		["<C-j>"] = actions.cycle_history_next,
		-- 		["<C-p>"] = actions.move_selection_next,
		-- 		["<C-n>"] = actions.move_selection_previous,
		-- 	},
		-- },
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
