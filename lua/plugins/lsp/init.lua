Servers = {
	"lua_ls",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"jdtls",
	"rust_analyzer",
	"clangd",
}

return {
	require("plugins.lsp.mason"),
	require("plugins.lsp.formatter"),
	require("plugins.lsp.lspconfig"),
	{ "simrat39/rust-tools.nvim" },
}
