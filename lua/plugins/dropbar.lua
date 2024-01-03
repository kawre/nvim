local user = require("config.user")

local M = {
    "Bekaboo/dropbar.nvim",
    dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    event = "VeryLazy",
}

M.opts = {
    icons = {
        kinds = {
            symbols = vim.tbl_map(function(icon) --
                return icon .. " "
            end, user.kinds),
        },
        ui = {
            bar = {
                separator = " " .. user.symbols.separator .. " ",
                extends = user.symbols.ellipsis,
            },
        },
    },
}

return M
