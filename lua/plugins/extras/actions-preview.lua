local M = {
    "aznhe21/actions-preview.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
}

M.keys = {
    {
        "<leader>la",
        mode = { "v", "n" },
        function()
            require("actions-preview").code_actions()
        end,
        desc = "Code Actions",
    },
    {
        "<C-.>",
        mode = { "v", "n" },
        function()
            require("actions-preview").code_actions()
        end,
        desc = "Code Actions",
    },
}

M.config = function()
    require("actions-preview").setup({
        telescope = {
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.5,
                height = 0.75,
                prompt_position = "top",
                preview_cutoff = 20,
                preview_height = function(_, _, max_lines)
                    return max_lines - 15
                end,
            },
        },
    })
end

return M
