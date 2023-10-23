local M = {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    enabled = false,
}

M.opts = {
    tabout = {
        enable = false,
        map = "<tab>",
        hopout = true,
        do_nothing_if_fail = true,
    },
}

return M
