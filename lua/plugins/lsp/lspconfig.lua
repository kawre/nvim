local M = {
	"neovim/nvim-lspconfig",
}

M.config = function()
	local lspconfig = require("lspconfig")
	require("plugins.lsp.handlers").setup()

	for server, name in pairs(_G.servers) do
		server = vim.split(server, "@")[1]

		local opts = {
			on_attach = require("plugins.lsp.handlers").on_attach,
			capabilities = require("plugins.lsp.handlers").capabilities,
		}

		local ok, lang = pcall(require, "plugins.lsp.settings." .. name)
		if ok then
			opts = vim.tbl_deep_extend("force", lang.settings(), opts)
		end

		lspconfig[server].setup(opts)
	end
end

return M
