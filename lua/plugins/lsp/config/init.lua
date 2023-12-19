local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "creativenull/efmls-configs-nvim",
        "folke/neodev.nvim",
        "folke/neoconf.nvim",
    },
}

M.config = function()
    require("plugins.lsp.handlers").setup()

    local utils = require("config.utils")
    local lspconfig = require("lspconfig")

    local t = utils.get_available_lsps()
    for _, lsp in ipairs(t) do
        local opts = {
            on_attach = require("plugins.lsp.handlers").on_attach,
            capabilities = require("plugins.lsp.handlers").capabilities,
        }

        local setup = require("plugins.lsp.config.setup." .. lsp) or {}

        if setup.enabled == nil or setup.enabled == true then
            lspconfig[lsp].setup(vim.tbl_deep_extend("force", opts, setup))
        end
    end
end

return M
