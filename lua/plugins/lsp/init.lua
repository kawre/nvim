require("plugins.lsp.handlers").setup()

return {
	require("plugins.lsp.mason"),
	require("plugins.lsp.lspconfig"),
}
