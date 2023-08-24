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
				package_installed = "◍",
				package_pending = "◍",
				package_uninstalled = "◍",
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		},
	})

	require("mason-lspconfig").setup({
		function()
			local ensure_installed = {}
			for key, _ in pairs(_G.servers) do
				table.insert(ensure_installed, key)
			end
			return ensure_installed
		end,
		automatic_installation = true,
	})
end

return M
