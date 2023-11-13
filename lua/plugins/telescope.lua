local M = {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
        "nvim-telescope/telescope-project.nvim",
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
}

M.keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
    { "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffer" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymap" },
    { "<leader>fp", "<cmd>Telescope project<CR>", desc = "Find Project" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Tags" },
    { "<leader>fn", "<cmd>Telescope notify<CR>", desc = "Find Notifications" },
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
    },
}

M.config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("notify")
end

return M
