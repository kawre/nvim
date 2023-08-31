local M = {
  filetypes = { "lua" },
}

M.config = {
  require("efmls-configs.linters.luacheck")
}

return M
