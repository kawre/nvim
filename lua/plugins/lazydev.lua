local M = {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
}

M.opts = {
    library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
    },
}

return M
