local M = {
  filetypes = { "css", "scss", "less", "sass" },
}

M.config = {
  require("efmls-configs.formatters.prettier"),
}

return M
