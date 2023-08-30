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
		-- ensure_installed = {
		-- 	"bashls",
		-- 	"clangd",
		-- 	"cssls",
		-- 	"html",
		-- 	"jsonls",
		-- 	"lua_ls",
		-- 	"nginx-language-server",
		-- 	"pyright",
		-- 	"rust_analyzer",
		-- 	"taplo",
		-- 	"tsserver",
		-- },
		automatic_installation = true,
	})
end

return M
