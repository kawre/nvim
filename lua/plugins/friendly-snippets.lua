local M = {
    "rafamadriz/friendly-snippets",
}

M.config = function() require("luasnip.loaders.from_vscode").lazy_load() end

return M
