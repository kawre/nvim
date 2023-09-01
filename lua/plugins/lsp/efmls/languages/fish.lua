local M = {
  filetypes = { "fish" }
}

M.config = {
  require('efmls-configs.linters.fish'),
  require('efmls-configs.formatters.fish_indent'),
}

return M
