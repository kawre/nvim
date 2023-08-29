local M = {
	"neovim/nvim-lspconfig",
}

M.config = function()
	local lspconfig = require("lspconfig")
	require("plugins.lsp.handlers").setup()

	for lang, lsp in pairs(_G.servers) do
		local opts = {
			on_attach = require("plugins.lsp.handlers").on_attach,
			capabilities = require("plugins.lsp.handlers").capabilities,
		}

		local ok, config = pcall(require, "plugins.lsp.settings." .. lang)
		if ok and config.setting ~= nil then
			opts = vim.tbl_deep_extend("force", config.settings(), opts)
		end

		lspconfig[lsp].setup(opts)
	end
end

return M
