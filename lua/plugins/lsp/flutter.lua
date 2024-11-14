local M = {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    enabled = false,
}


M.opts = {
    lsp = {
        on_attach = require("plugins.lsp.config.handlers").on_attach,
        capabilities = require("plugins.lsp.config.handlers").capabilities,
    },
}

return M
