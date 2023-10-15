local M = {
    filetypes = { "markdown" },
}

M.config = {
    require("efmls-configs.formatters.prettier_d"),
    require("efmls-configs.linters.markdownlint"),
}

return M
