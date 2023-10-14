local M = {
    filetypes = { "markdown" },
}

M.config = {
    require("efmls-configs.formatters.dprint"),
    require("efmls-configs.linters.markdownlint"),
}

return M
