local M = {
  "neovim/nvim-lspconfig",
}

M.config = function()
  require("plugins.lsp.handlers").setup()

  local utils = require("config.utils")
  local lspconfig = require("lspconfig")

  local t = utils.scandir("~/.config/nvim/lua/plugins/lsp/config/setup")
  for _, lsp in ipairs(t) do
    local opts = {
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,
    }

    opts = vim.tbl_deep_extend("force", opts, require("plugins.lsp.config.setup." .. lsp) or {})
    lspconfig[lsp].setup(opts)
  end
end

return M
