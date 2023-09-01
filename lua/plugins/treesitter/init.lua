local M = {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  dependencies = {
    require("plugins.treesitter.autopairs"),
    require("plugins.treesitter.surround"),
  },
}

M.opts = {
  ensure_installed = "all",
  sync_install = false,
  -- indent = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autopairs = {
    enable = true,
  },
}

return M
