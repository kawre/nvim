local M = {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim", -- optional
    },
    enabled = false,
    cmd = "Neogit",
}

M.config = true

return M
