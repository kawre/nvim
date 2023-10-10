local M = {
    filetypes = { "python" },
}

M.config = {
    require("efmls-configs.linters.flake8"),
    require("efmls-configs.formatters.black"),
}

return M
