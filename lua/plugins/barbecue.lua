local user = require("config.user")

local M = {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    -- dev = true,
    -- enabled = false,
}

M.opts = {
    show_modified = true,
    symbols = {
        modified = user.symbols.modified,
        ellipsis = user.symbols.ellipsis,
        separator = user.symbols.separator,
    },
    kinds = user.kinds,
    dir_display_limit = 3,
}

return M
