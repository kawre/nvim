local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    event = "VeryLazy",
}

M.opts = {
    ui = {
        border = "none",
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
    },
}

M.config = function(_, opts)
    require("mason").setup(opts)

    require("mason-lspconfig").setup({
        ensure_installed = require("config.utils").get_available_lsps(),
        automatic_installation = true,
    })
end

return M
