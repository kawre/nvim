local M = {
    filetypes = { "python" },
}

M.config = {
    require("efmls-configs.formatters.black"),
}

return M
