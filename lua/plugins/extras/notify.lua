local M = {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
}

M.opts = {
    -- render = "wrapped-compact",
    -- max_width = 75,
}

M.config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
end

return M
