local M = {
  filetypes = { "sh" }
}

M.config = {
  require('efmls-configs.formatters.shfmt'),
}

return M
