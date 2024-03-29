local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "neodev.nvim",
        "neoconf.nvim",
        "nvim-navbuddy",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
}

M.config = function()
    require("plugins.lsp.config.handlers").setup()

    local utils = require("config.utils")
    local lspconfig = require("lspconfig")

    local opts = {
        on_attach = require("plugins.lsp.config.handlers").on_attach,
        capabilities = require("plugins.lsp.config.handlers").capabilities,
    }

    for _, lsp in ipairs(utils.get_available_lsps()) do
        local setup = require("plugins.lsp.config.settings." .. lsp) or {}

        if setup.enabled == nil or setup.enabled == true then
            lspconfig[setup.name or lsp].setup(vim.tbl_deep_extend("force", opts, setup))
        end
    end
end

return M
