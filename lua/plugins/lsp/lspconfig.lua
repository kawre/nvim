local Utils = require("config.utils")

local M = {
	"neovim/nvim-lspconfig",
}

M.config = function()
	local lspconfig = require("lspconfig")

	local lsps = Utils.scandir("~/.config/nvim/lua/plugins/lsp/config")
	for _, lsp in ipairs(lsps) do
		lsp = vim.split(lsp, ".lua")[1]

		local opts = {
			on_attach = require("plugins.lsp.handlers").on_attach,
			capabilities = require("plugins.lsp.handlers").capabilities,
		}

		opts = vim.tbl_deep_extend("force", opts, require("plugins.lsp.config." .. lsp).setup())
		lspconfig[lsp].setup(opts)
	end
end

return M
