local user = require("config.user")

local M = {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
}

M.opts = {
  show_modified = true,
  symbols = {
    modified = user.symbols.modified,
    ellipsis = user.symbols.ellipsis,
    separator = user.symbols.separator,
  },
  kinds = user.kinds,
}

return M
