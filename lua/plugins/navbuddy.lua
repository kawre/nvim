local M = {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
}

M.keys = {
    { "<leader>s", "<cmd>Navbuddy<cr>", "Show file scope" },
}

M.opts = {
    lsp = { auto_attach = true },
}

return M
