local M = {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
}

M.config = function()
    vim.g.rustaceanvim = {
        standalone = true,
    }
end

return M
