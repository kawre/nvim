local M = {
  filetypes = { "html" }
}

M.config = {
  require('efmls-configs.linters.djlint')
}

return M
