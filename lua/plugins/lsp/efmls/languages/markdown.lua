local M = {
    filetypes = { "markdown" },
}

M.config = {
    -- require("efmls-configs.formatters.cbfmt"),
    require("efmls-configs.formatters.mdformat"),
    require("efmls-configs.linters.markdownlint"),
}

return M
