local M_lspconfig = {
	"williamboman/mason-lspconfig.nvim",
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

M_lspconfig.opts = function(_, opts)
	require("mason-lspconfig")

	local res = {}
	for key, _ in pairs(_G.servers) do
		table.insert(res, key)
	end

	opts.ensure_installed = res
	opts.automatic_installation = true
end

return M
