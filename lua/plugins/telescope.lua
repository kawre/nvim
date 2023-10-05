local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-project.nvim",
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
}

M.keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
    { "<leader>ft", "<cmd>Telescope live_grep<CR>",  desc = "Find Text" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find Buffer" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>",    desc = "Find Keymap" },
    { "<leader>fp", "<cmd>Telescope project<CR>",    desc = "Find Project" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Find Tags" },
    { "<leader>fn", "<cmd>Telescope notify<CR>",     desc = "Find Notifications" },
}

M.config = function()
    local telescope = require("telescope")

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
        extensions = {
            project = {
                base_dirs = { "~/projects" },
                hidden_files = true, -- default: false
                theme = "dropdown",
                order_by = "asc",
                search_by = "title",
                sync_with_nvim_tree = true, -- default false
                -- default for on_project_selected = find project files
            },
        },
    })

    telescope.load_extension("notify")
end

return M
