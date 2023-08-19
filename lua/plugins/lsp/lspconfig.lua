local M = {
	"neovim/nvim-lspconfig",
	config = function() end,
}

M.config = function()
	local lspconfig = require("lspconfig")
	require("plugins.lsp.handlers").setup()

	local opts = {}
	for _, server in pairs(Servers) do
		server = vim.split(server, "@")[1]

		opts = {
			on_attach = require("plugins.lsp.handlers").on_attach,
			capabilities = require("plugins.lsp.handlers").capabilities,
		}

		local ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)
		if ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		lspconfig[server].setup(opts)
	end
end

return M
