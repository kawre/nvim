local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

M.config = function()
  require("mason").setup({
    ui = {
      border = "none",
      icons = {
        package_installed = "",
        package_pending = "",
        package_uninstalled = "",
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    },
  })

  require("mason-lspconfig").setup({
    ensure_installed = require('config.utils').get_available_lsps(),
    automatic_installation = true,
  })
end

return M
