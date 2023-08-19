local M = {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
}

M.config = function()
	require("luasnip.loaders.from_vscode").lazy_load()
end

return M
