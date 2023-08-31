local M = {
  filetypes = { "fish" }
}

M.config = {
  require('efmls-configs.formatters.fish_indent'),
}

return M
