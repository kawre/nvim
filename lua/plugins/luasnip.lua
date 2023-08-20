local M = {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
}

-- M.keys = {
-- 	{ "<C-l>", ":lua require('luasnip').jump(-1)<CR>", desc = "Jump Prev" },
-- 	{ "<C-j>", function()
--
--   end, desc = "Jump Next" },
-- }

M.config = function()
	require("luasnip.loaders.from_vscode").lazy_load()
end

return M
