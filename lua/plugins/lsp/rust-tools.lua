local M = {
    -- "simrat39/rust-tools.nvim",
    -- ft = "rust",

    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
}

M.config = function()
    vim.g.rustaceanvim = {
        standalone = true,
    }
end

return M
