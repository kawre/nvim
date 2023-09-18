local M = {
  filetypes = { "lua" },
}

M.config = {
  require("efmls-configs.formatters.stylua"),
  -- require("efmls-configs.linters.luacheck"),
}

return M
