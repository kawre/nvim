local M = {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}

M.keys = {
    { mode = { "n" }, "<leader>tt", "<cmd>TroubleToggle<cr>" },
    { mode = { "n" }, "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
    { mode = { "n" }, "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
    { mode = { "n" }, "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
    { mode = { "n" }, "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
    { mode = { "n" }, "gR", "<cmd>TroubleToggle lsp_references<cr>" },
}

M.opts = {}

return M
