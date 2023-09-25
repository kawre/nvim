local M = {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    enabled = false,
}

M.config = function()
    require("dashboard").setup({
        -- config
    })
end

return M
