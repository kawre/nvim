local M = {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    enabled = false,
}

M.opts = {
    -- render = "wrapped-compact",
    -- max_width = 75,
    on_open = function(win) --
        vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
}

M.config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
end

return M
