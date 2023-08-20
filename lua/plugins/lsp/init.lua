Servers = {
	["lua_ls"] = "lua",
	["cssls"] = "css",
	["html"] = "html",
	["tsserver"] = "typescript",
	["pyright"] = "python",
	["bashls"] = "bash",
	["jsonls"] = "json",
	["yamlls"] = "yaml",
	["jdtls"] = "java",
	["rust_analyzer"] = "rust",
	["clangd"] = "clang",
}

return {
	require("plugins.lsp.formatter"),
	require("plugins.lsp.mason"),
	require("plugins.lsp.lspconfig"),
}
