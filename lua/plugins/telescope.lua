local M = {
	"nvim-telescope/telescope.nvim",
	version = false,
	dependencies = {
		"plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	cmd = "Telescope",
}

M.keys = {
	{ "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find File" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
	{ "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffer" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymap" },
	{ "<leader>fp", "<cmd>Telescope project<CR>", desc = "Find Project" },
	{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Tags" },
	{ "<leader>fn", "<cmd>Telescope notifier<CR>", desc = "Find Notifications" },
	{ "<leader>s", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find Document Symbols" },
}

M.opts = {
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "󱞪 ",
		path_display = { "smart" },
		layout_strategy = "vertical",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",

			vertical = {
				preview_height = 0.6,
			},
		},
		file_ignore_patterns = {
			".git/",
			"tests/",
			"node_modules",
		},
	},
	extensions = {
		project = {
			base_dirs = { "~/projects", "~/pjatk" },
			hidden_files = true, -- default: false
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			-- sync_with_nvim_tree = true, -- default false
			-- default for on_project_selected = find project files
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
}

M.config = function(_, opts)
	local telescope = require("telescope")

	telescope.setup(opts)
	-- telescope.load_extension("notify")
	telescope.load_extension("fzf")
end

return M
