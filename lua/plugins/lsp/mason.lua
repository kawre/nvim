local M_lspconfig = {
	"williamboman/mason-lspconfig.nvim",
}

M_lspconfig.opts = {
	ensure_installed = Servers,
	automatic_installation = true,
}

local M = {
	"williamboman/mason.nvim",
	dependencies = { M_lspconfig },
}

M.opts = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

return M
