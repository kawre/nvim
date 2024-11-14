---@module 'snacks'

local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
}

---@type snacks.Config
M.opts = {
    bigfile = { enabled = true },
    notifier = {
        enabled = true,
        timeout = 2000,
    },
    quickfile = { enabled = true },
    statuscolumn = {
        enabled = true,
        left = { "mark", "sign", "git" },
        right = { "fold" },
        folds = {
            open = true,
            git_hl = false,
        },
    },
    words = { enabled = true },
    styles = {
        notification = {
            wo = { wrap = true }, -- Wrap notifications
        },
    },
}

M.keys = {
    {
        "<leader>fn",
        function()
            Snacks.notifier.show_history()
        end,
        desc = "Notification History",
    },
}

return M
