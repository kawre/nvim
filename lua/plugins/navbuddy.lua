local M = {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    event = "VeryLazy",
}

M.keys = {
    { "<leader>s", "<cmd>Navbuddy<cr>", "Show file scope" },
}

M.opts = {
    lsp = {
        auto_attach = true,
    },
    window = {
        size = { height = "80%", width = "80%" },
    },
}

return M
