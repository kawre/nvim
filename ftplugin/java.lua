local opt = vim.opt_local

opt.tabstop = 4
opt.shiftwidth = 4

require("plugins.lsp.config.setup.jdtls").setup()
